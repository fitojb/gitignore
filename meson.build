project('com.github.arshubham.gitignore', ['vala', 'c'],
    version : '2.0.0',
    license: 'GPL-3.0'
)

add_project_arguments([
        '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
    ],
    language: 'c',
)

gnome = import('gnome')
i18n = import('i18n')

gresource = gnome.compile_resources(
    'as-resources', 'data/com.github.arshubham.gitignore.gresource.xml',
    source_dir: 'data',
    c_name: 'as'
)

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

c_args = [
  '-include', 'config.h'
]

sources = files()

subdir('data')
subdir('src')
subdir('po')

dependencies = [
	dependency('gobject-2.0'),
    dependency('glib-2.0'),
    dependency('granite'),
    dependency('gtk+-3.0'),
    dependency('gee-0.8'),
    dependency('gtksourceview-3.0'),
    dependency('libsoup-2.4'),
]

e = executable('com.github.arshubham.gitignore',
    sources,
    gresource,
    c_args: c_args,
    dependencies: dependencies,
    install : true
)

meson.add_install_script('meson/post_install.py')
