/*
* Copyright (C) 2018  Shubham Arora <shubhamarora@protonmail.com>
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

using App.Configs;

namespace App.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        public signal void menu_clicked ();
        public Gtk.MenuButton menu_button { get; private set; }

        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            
            var search_entry = new Gtk.SearchEntry ();
            search_entry.placeholder_text = _("Languages, separated by commas");
            search_entry.hexpand = true;
            search_entry.valign = Gtk.Align.CENTER;

            var dark_switch = new Gtk.Switch ();
            dark_switch.valign = Gtk.Align.CENTER;

            var light_icon = new Gtk.Image.from_icon_name ("display-brightness-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
            light_icon.tooltip_text = "Light background";

            var dark_icon = new Gtk.Image.from_icon_name ("weather-clear-night-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
            dark_icon.tooltip_text = "Dark background";

            var completion = new Gtk.EntryCompletion ();
            search_entry.set_completion (completion);
            completion.inline_selection = true;
            completion.inline_completion = true;
            completion.popup_single_match = false;

            string[] data = {"1c", "1c-bitrix", "a-frame", "actionscript", "ada", "adobe", "advancedinstaller", "agda", "alteraquartusii", "altium", "android", "androidstudio", "angular", "anjuta", "ansible", "apachecordova", "apachehadoop", "appbuilder", "appceleratortitanium", "appcode", "appcode+all", "appcode+iml", "appengine", "aptanastudio", "arcanist", "archive", "archives", "archlinuxpackages", "aspnetcore", "assembler", "atmelstudio", "ats", "audio", "automationstudio", "autotools", "backup", "basercms", "basic", "batch", "bazaar", "bazel", "bitrix", "bittorrent", "blackbox", "bluej", "bookdown", "bower", "bricxcc", "buck", "c", "c++", "cake", "cakephp", "calabash", "carthage", "ceylon", "cfwheels", "chefcookbook", "clean", "clion", "clion+all", "clion+iml", "clojure", "cloud9", "cmake", "cocoapods", "cocos2dx", "cocoscreator", "code", "code-java", "codeblocks", "codecomposerstudio", "codeigniter", "codeio", "codekit", "coffeescript", "commonlisp", "composer", "compressed", "compressedarchive", "compression", "concrete5", "coq", "craftcms", "crashlytics", "crbasic", "crossbar", "crystal", "csharp", "cuda", "cvs", "d", "dart", "darteditor", "data", "database", "datarecovery", "dbeaver", "delphi", "diskimage", "django", "dm", "docfx", "dotfilessh", "dotsettings", "dreamweaver", "dropbox", "drupal", "drupal7", "drupal8", "eagle", "easybook", "eclipse", "eiffelstudio", "elasticbeanstalk", "elisp", "elixir", "elm", "emacs", "ember", "ensime", "episerver", "erlang", "espresso", "executable", "expressionengine", "extjs", "fancy", "fastlane", "finale", "firebase", "flashbuilder", "flex", "flexbuilder", "floobits", "flutter", "font", "fontforge", "forcedotcom", "fortran", "freepascal", "fsharp", "fuelphp", "fusetools", "games", "gcov", "genero4gl", "geth", "ggts", "gis", "git", "gitbook", "go", "godot", "gpg", "gradle", "grails", "greenfoot", "grunt", "gwt", "haskell", "hexo", "homeassistant", "hsp", "hugo", "hyperledgercomposer", "iar", "iar_ewarm", "iarembeddedworkbench", "idris", "igorpro", "images", "infer", "inforcrm", "intellij", "intellij+all", "intellij+iml", "ionic3", "jabref", "java", "java-web", "jboss", "jboss-4-2-3-ga", "jboss-6-x", "jdeveloper", "jekyll", "jetbrains", "jetbrains+all", "jetbrains+iml", "jigsaw", "jmeter", "joe", "joomla", "jspm", "julia", "jupyternotebook", "justcode", "kate", "kdevelop4", "keil", "kentico", "kicad", "kirby2", "kobalt", "kohana", "komodoedit", "kotlin", "labview", "lamp", "laravel", "latex", "lazarus", "leiningen", "lemonstand", "less", "liberosoc", "librarian-chef", "libreoffice", "lilypond", "linux", "lithium", "lua", "lyx", "m2e", "macos", "magento", "magento2", "magic-xpa", "matlab", "maven", "mavensmate", "mean", "mercurial", "mercury", "metaprogrammingsystem", "meteorjs", "microsoftoffice", "mikroc", "moban", "modelsim", "modx", "momentics", "monodevelop", "mplabx", "mule", "nanoc", "nativescript", "ncrunch", "nesc", "netbeans", "nette", "nikola", "nim", "ninja", "node", "notepadpp", "nwjs", "objective-c", "ocaml", "octobercms", "opa", "opencart", "opencv", "openfoam", "openframeworks", "oracleforms", "osx", "otto", "packer", "particle", "pawn", "perl", "perl6", "ph7cms", "phalcon", "phoenix", "phpcodesniffer", "phpstorm", "phpstorm+all", "phpstorm+iml", "pimcore", "pinegrow", "platformio", "playframework", "plone", "polymer", "powershell", "premake-gmake", "prepros", "prestashop", "processing", "progressabl", "psoccreator", "puppet-librarian", "purebasic", "purescript", "pvs", "pycharm", "pycharm+all", "pycharm+iml", "pydev", "python", "qml", "qooxdoo", "qt", "qtcreator", "r", "racket", "rails", "reactnative", "red", "redcar", "redis", "rhodesrhomobile", "rider", "root", "ros", "ruby", "rubymine", "rubymine+all", "rubymine+iml", "rust", "salesforce", "salesforcedx", "sas", "sass", "sbt", "scala", "scheme", "scons", "scrivener", "sdcc", "seamgen", "senchatouch", "serverless", "shopware", "silverstripe", "sketchup", "slickedit", "smalltalk", "snapcraft", "solidity", "soliditytruffle", "sonar", "sonarqube", "sourcepawn", "splunk", "spreadsheet", "standardml", "stata", "stdlib", "stella", "stellar", "stylus", "sublimetext", "sugarcrm", "svn", "swift", "swiftpackagemanager", "swiftpm", "symfony", "symphonycms", "synology", "synopsysvcs", "tags", "tarmainstallmate", "terraform", "test", "testcomplete", "testinfra", "tex", "text", "textmate", "textpattern", "theos-tweak", "tortoisegit", "tower", "turbogears2", "typings", "typo3", "umbraco", "unity", "unrealengine", "vaadin", "vagrant", "valgrind", "vapor", "venv", "vertx", "video", "vim", "virtualenv", "virtuoso", "visualstudio", "visualstudiocode", "vivado", "vvvv", "waf", "wakanda", "web", "webmethods", "webstorm", "webstorm+all", "webstorm+iml", "werckercli", "windows", "wintersmith", "wordpress", "xamarinstudio", "xcode", "xcodeinjection", "xilinxise", "xilinxvivado", "xill", "xojo", "xtext", "y86", "yeoman", "yii", "yii2", "zendframework", "zephir"};

            Gtk.ListStore list_store = new Gtk.ListStore (1, typeof (string));
		    completion.set_model (list_store);
            completion.set_text_column (0);
            
            Gtk.TreeIter iter;
            for (int i = 0; i < data.length ; i++) {
                list_store.append (out iter);
                list_store.set (iter, 0, data[i]);
            }

            Gee.HashSet<string> selected_languages = new Gee.HashSet<string> ();

            Gee.ArrayList<string> list = new Gee.ArrayList<string> ();
            for (int i = 0; i < data.length; i++) {
                list.add (data[i]);
            }

            search_entry.activate.connect (() => {
                string entered_language = search_entry.text;
                if (list.contains (entered_language) && !selected_languages.contains(entered_language) && entered_language.strip ().length != 0) {
                    selected_languages.add(entered_language);
                    debug ("Selected Language: %s\n", entered_language);
                } else if (selected_languages.contains(entered_language)) {
                    debug ("Selected Language: %s, already in the set\n", entered_language);
                } else {
                    debug ("Unknown Language\n");
                }
            });

            this.set_custom_title (search_entry);
            this.pack_end (dark_icon);
            this.pack_end (dark_switch);
            this.pack_end (light_icon);

            this.show_close_button = true;
        }
    }
}
