echo "from gi.repository import GObject, Gedit
UI_XML = \"\"\"<ui>
<menubar name=\"MenuBar\">
    <menu name=\"ToolsMenu\" action=\"Tools\">
      <placeholder name=\"ToolsOps_3\">
        <menuitem name=\"Action_$PNAME\" action=\"ACTION_$PNAME\"/>
      </placeholder>
    </menu>
</menubar>
</ui>\"\"\"
class module_$PNAME(GObject.Object, Gedit.WindowActivatable):
    __gtype_name__ = \"module_$PNAME\"
    window = GObject.property(type=Gedit.Window)
    def __init__(self):
	GObject.Object.__init__(self)
    def _add_ui(self):
        manager = self.window.get_ui_manager()
        self._actions = Gtk.ActionGroup(\"moduleactions_$PNAME\")
        self._actions.add_actions([
            ('moduleaction_$PNAME', Gtk.STOCK_INFO, \"Say _Hello\", 
                None, \"Say hello to the current document\", 
                self.on_action_activate_$PNAME),
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
    def on_action_activate_$PNAME():
        view = self.window.get_active_view()
	if view:
		view.get_buffer().insert_at_cursor(\"Hello World!\")
    def _remove_ui(self):
        manager = self.window.get_ui_manager()
        manager.remove_ui(self._ui_merge_id)
        manager.remove_action_group(self._actions)
        manager.ensure_update()
" > module_$PNAME.py