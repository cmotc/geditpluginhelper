echo "from gi.repository import GObject, Gedit
class module_$PNAME(GObject.Object, Gedit.ViewActivatable):
    __gtype_name__ = \"module_$PNAME\"
    view = GObject.property(type=Gedit.View)
    def __init__(self):
	GObject.Object.__init__(self)
    def do_activate(self):
	print \"View %s activated.\" % self.view
    def do_deactivate(self):
	print \"View %s deactivated.\" % self.view
    def do_update_state(self):
	print \"View %s state updated.\" % self.view
" > module_$PNAME.py