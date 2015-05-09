#! /bin/bash
HELP='
A script which generates a skeleton gedit plugin project.

usage: Gedit Plugin Helper can be used interactively, by passing parameters, or
by passing some parameters and interactively entering other parameters.
	--name|n The name of the project. Module name will be module_$NAME
	--desc|d A brief description of the project
	--auth|a The name of the project creator
	--copy|c Additional copyright info for plugin file (Optional)
	--site|s Web site for the plugin/author
	--help|h display this message
	--p AppActivatable Plugin
	--w WindowActivatable Plugin
	--v ViewActivatable Plugin
'
while getopts name:n:desc:d:auth:a:copy:c:site:s:help:h:pwv params
do; case "${params}"
	in
		name|n) NAME=${OPTARG}
		desc|d) DESCRIPTION=${OPTARG}
		auth|a) AUTHORS=${OPTARG}
		copy|c) COPYRIGHT=${OPTARG}
		site|s) WEBSITE=${OPTARG}
		p) APPACT="true"
		w) WINACT="true"
		v) VIEACT="true"
		help|h) echo $HELP
esac; done
echo $HELP
echo '-------------------------------------------------------------------------'
echo "starting interactive mode:"
if [ -n "$NAME" ]; then
	read -p NAME "Enter a name for your plugin"
fi
if [ -n "$DESCRIPTION" ]; then
	read -p DESCRIPTION "Enter a description for your plugin"
fi
if [ -n "$AUTHORS" ]; then
	read -p AUTHORS "Your name?"
fi
if [ -n "$COPYRIGHT" ]; then
	read -p COPYRIGHT "Additional license info in Plugin file?"
if [ -n "$WEBSITE" ]; then
	read -p WEBSITE "What is the website for this plugin?"
fi
if [-n "$APPACT"]; then
if [-n "$WINACT"]; then
if [-n "$VIEACT"]; then
while true
    do
        read -p "What kind of plugin p(AppActivatable)w(WindowActivatable)v(ViewActivatable)" ANSWER
        case $ANSWER in
        [p]* ) APPACT="true"
        [w]* ) WINACT="true"
        [v]* ) VIEACT="true"
        *) echo "What kind of plugin p(AppActivatable)w(WindowActivatable)v(ViewActivatable)"
	esac
    done
fi
fi
fi
echo "finished interactive mode"
mkdir -p $NAME
cd $NAME
echo "[Plugin]
Loader=python
Module=module_$NAME
IAge=3
Name=$NAME
Description=$DESDCRIPTION
Authors=$AUTHORS
Copyright=Copyright © $AUTHORS $COPYRIGHT
Website=$WEBSITE
Version=3.0.0" > $NAME.plugin

if [$APPACT=="true"]; then
	echo "from gi.repository import GObject, Gedit
class module_$NAME(GObject.Object, Gedit.AppActivatable):
    __gtype_name__ = \"module_$NAME\"
    app = GObject.property(type=Gedit.App)
    def __init__(self):
	GObject.Object.__init__(self)
    def do_activate(self):
	print \"App %s activated.\" % self.app
    def do_deactivate(self):
	print \"App %s deactivated.\" % self.app
    def do_update_state(self):
	print \"App %s state updated.\" % self.app
" > module_$NAME.py
fi
if [$WINACT=="true"]; then
	echo "from gi.repository import GObject, Gedit
UI_XML = \"\"\"<ui>
<menubar name=\"MenuBar\">
    <menu name=\"ToolsMenu\" action=\"Tools\">
      <placeholder name=\"ToolsOps_3\">
        <menuitem name=\"Action_$NAME\" action=\"ACTION_$NAME\"/>
      </placeholder>
    </menu>
</menubar>
</ui>\"\"\"
class module_$NAME(GObject.Object, Gedit.WindowActivatable):
    __gtype_name__ = \"module_$NAME\"
    window = GObject.property(type=Gedit.Window)
    def __init__(self):
	GObject.Object.__init__(self)
    def _add_ui(self):
        manager = self.window.get_ui_manager()
        self._actions = Gtk.ActionGroup(\"moduleactions_$NAME\")
        self._actions.add_actions([
            ('moduleaction_$NAME', Gtk.STOCK_INFO, \"Say _Hello\", 
                None, \"Say hello to the current document\", 
                self.on_action_activate_$NAME),
        ])
        manager.insert_action_group(self._actions)
        self._ui_merge_id = manager.add_ui_from_string(UI_XML)
        manager.ensure_update()
    def do_activate(self):
        print \"Window %s activated.\" % self.window
    def do_deactivate(self):
        print \"Window %s deactivated.\" % self.window
    def do_update_state(self):
        print \"Window %s state updated.\" % self.window
    def on_action_activate_$NAME():
        view = self.window.get_active_view()
	if view:
		view.get_buffer().insert_at_cursor(\"Hello World!\")
    def _remove_ui(self):
        manager = self.window.get_ui_manager()
        manager.remove_ui(self._ui_merge_id)
        manager.remove_action_group(self._actions)
        manager.ensure_update()
" > module_$NAME.py
fi
if [$VIEACT=="true"]; then
	echo "from gi.repository import GObject, Gedit
class module_$NAME(GObject.Object, Gedit.ViewActivatable):
    __gtype_name__ = \"module_$NAME\"
    view = GObject.property(type=Gedit.View)
    def __init__(self):
	GObject.Object.__init__(self)
    def do_activate(self):
	print \"View %s activated.\" % self.view
    def do_deactivate(self):
	print \"View %s deactivated.\" % self.view
    def do_update_state(self):
	print \"View %s state updated.\" % self.view
" > module_$NAME.py
fi
