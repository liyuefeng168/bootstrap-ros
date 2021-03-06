# -*- coding: utf-8 -*-
"""
    test_config
    ~~~~~~~~~~~

    Test the sphinx.config.Config class and its handling in the
    Application class.

    :copyright: Copyright 2007-2016 by the Sphinx team, see AUTHORS.
    :license: BSD, see LICENSE for details.
"""
from six import PY2, PY3, StringIO

from util import TestApp, with_app, with_tempdir, raises, raises_msg

from sphinx.config import Config
from sphinx.errors import ExtensionError, ConfigError, VersionRequirementError


@with_app(confoverrides={'master_doc': 'master', 'nonexisting_value': 'True',
                         'latex_elements.docclass': 'scrartcl',
                         'modindex_common_prefix': 'path1,path2'})
def test_core_config(app, status, warning):
    cfg = app.config

    # simple values
    assert 'project' in cfg.__dict__
    assert cfg.project == 'Sphinx <Tests>'
    assert cfg.templates_path == ['_templates']

    # overrides
    assert cfg.master_doc == 'master'
    assert cfg.latex_elements['docclass'] == 'scrartcl'
    assert cfg.modindex_common_prefix == ['path1', 'path2']

    # simple default values
    assert 'locale_dirs' not in cfg.__dict__
    assert cfg.locale_dirs == []
    assert cfg.trim_footnote_reference_space is False

    # complex default values
    assert 'html_title' not in cfg.__dict__
    assert cfg.html_title == 'Sphinx <Tests> 0.6alpha1 documentation'

    # complex default values mustn't raise
    for valuename in cfg.config_values:
        getattr(cfg, valuename)

    # "contains" gives True both for set and unset values
    assert 'project' in cfg
    assert 'html_title' in cfg
    assert 'nonexisting_value' not in cfg

    # invalid values
    raises(AttributeError, getattr, cfg, '_value')
    raises(AttributeError, getattr, cfg, 'nonexisting_value')

    # non-value attributes are deleted from the namespace
    raises(AttributeError, getattr, cfg, 'sys')

    # setting attributes
    cfg.project = 'Foo'
    assert cfg.project == 'Foo'

    # alternative access via item interface
    cfg['project'] = 'Sphinx Tests'
    assert cfg['project'] == cfg.project == 'Sphinx Tests'


@with_app()
def test_extension_values(app, status, warning):
    cfg = app.config

    # default value
    assert cfg.value_from_ext == []
    # non-default value
    assert cfg.value_from_conf_py == 84

    # no duplicate values allowed
    raises_msg(ExtensionError, 'already present', app.add_config_value,
               'html_title', 'x', True)
    raises_msg(ExtensionError, 'already present', app.add_config_value,
               'value_from_ext', 'x', True)


@with_tempdir
def test_errors_warnings(dir):
    # test the error for syntax errors in the config file
    (dir / 'conf.py').write_text(u'project = \n', encoding='ascii')
    raises_msg(ConfigError, 'conf.py', Config, dir, 'conf.py', {}, None)

    # test the automatic conversion of 2.x only code in configs
    (dir / 'conf.py').write_text(
        u'# -*- coding: utf-8\n\nproject = u"Jägermeister"\n',
        encoding='utf-8')
    cfg = Config(dir, 'conf.py', {}, None)
    cfg.init_values(lambda warning: 1/0)
    assert cfg.project == u'Jägermeister'

    # test the warning for bytestrings with non-ascii content
    # bytestrings with non-ascii content are a syntax error in python3 so we
    # skip the test there
    if PY3:
        return
    (dir / 'conf.py').write_text(
        u'# -*- coding: latin-1\nproject = "fooä"\n', encoding='latin-1')
    cfg = Config(dir, 'conf.py', {}, None)
    warned = [False]
    def warn(msg):
        warned[0] = True
    cfg.check_unicode(warn)
    assert warned[0]


@with_tempdir
def test_errors_if_setup_is_not_callable(dir):
    # test the error to call setup() in the config file
    (dir / 'conf.py').write_text(u'setup = 1')
    raises_msg(ConfigError, 'callable', TestApp, srcdir=dir)


def test_needs_sphinx():
    raises(VersionRequirementError, TestApp,
           confoverrides={'needs_sphinx': '9.9'})


@with_tempdir
def test_config_eol(tmpdir):
    # test config file's eol patterns: LF, CRLF
    configfile = tmpdir / 'conf.py'
    for eol in (b'\n', b'\r\n'):
        configfile.write_bytes(b'project = "spam"' + eol)
        cfg = Config(tmpdir, 'conf.py', {}, None)
        cfg.init_values(lambda warning: 1/0)
        assert cfg.project == u'spam'


TYPECHECK_OVERRIDES = [
    # configuration key, override value, should warn, default type
    ('master_doc', 123, True, str),
    ('man_pages', 123, True, list),  # lambda
    ('man_pages', [], False, list),
    ('epub_tocdepth', True, True, int),  # child type
    ('nitpicky', 3, False, bool),  # parent type
    ('templates_path', (), True, list),  # other sequence, also raises
]
if PY2:
    # Run a check for proper sibling detection in Python 2.  Under py3k, the
    # default types do not have any siblings.
    TYPECHECK_OVERRIDES.append(
            ('html_add_permalinks', 'bar', False, unicode))

def test_gen_check_types():
    for key, value, should, deftype in TYPECHECK_OVERRIDES:
        warning = StringIO()
        try:
            app = TestApp(confoverrides={key: value}, warning=warning)
        except:
            pass
        else:
            app.cleanup()

        real = type(value).__name__
        msg = ("WARNING: the config value %r has type `%s',"
               " defaults to `%s.'\n" % (key, real, deftype.__name__))
        def test():
            warning_list = warning.getvalue()
            assert (msg in warning_list) == should, \
                    "Setting %s to %r should%s raise: %s" % \
                    (key, value, " not" if should else "", msg)
        test.description = "test_check_type_%s_on_%s" % \
                (real, type(Config.config_values[key][0]).__name__)

        yield test
