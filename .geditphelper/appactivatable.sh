echo "from gi.repository import GObject, Gedit
class module_$PNAME(GObject.Object, Gedit.AppActivatable):
    __gtype_name__ = \"module_$PNAME\"
    app = GObject.property(type=Gedit.App)
    def __init__(self):
	GObject.Object.__init__(self)
    def do_activate(self):
	print \"App %s activated.\" % self.app
    def do_deactivate(self):
	print \"App %s deactivated.\" % self.app
    def do_update_state(self):
	print \"App %s state updated.\" % self.app
" > module_$PNAME.py