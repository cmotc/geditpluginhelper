[+ autogen5 template +]
[+INCLUDE (string-append "licenses/" (get "License") ".tpl") \+]
[+INCLUDE (string-append "indent.tpl") \+]
/* [+INVOKE EMACS-MODELINE MODE="C" \+] */
[+INVOKE START-INDENT\+]
/*
 * main.c
 * Copyright (C) [+(shell "date +%Y")+] [+Author+][+IF (get "Email")+] <[+Email+]>[+ENDIF+]
 * 
[+INVOKE LICENSE-DESCRIPTION PFX=" * " PROGRAM=(get "Name") OWNER=(get "Author") \+]
 */

using GLib;
using Gtk;

public class Main : Object 
{
[+IF (=(get "HaveBuilderUI") "1")+]
	/* 
	 * Uncomment this line when you are done testing and building a tarball
	 * or installing
	 */
	//const string UI_FILE = Config.PACKAGE_DATA_DIR + "/ui/" + "[+NameHLower+].ui";
	const string UI_FILE = "src/[+NameHLower+].ui";

	/* ANJUTA: Widgets declaration for [+NameHLower+].ui - DO NOT REMOVE */
[+ENDIF+]

	public Main ()
	{
[+IF (=(get "HaveBuilderUI") "1")+]
		try 
		{
			var builder = new Builder ();
			builder.add_from_file (UI_FILE);
			builder.connect_signals (this);

			var window = builder.get_object ("window") as Window;
			/* ANJUTA: Widgets initialization for [+NameHLower+].ui - DO NOT REMOVE */
			window.show_all ();
		} 
		catch (Error e) {
			stderr.printf ("Could not load UI: %s\n", e.message);
		} 
[+ELSE+]
		Window window = new Window();
		window.set_title ("Hello World");
		window.show_all();
		window.destroy.connect(on_destroy);
[+ENDIF+]
	}
[+IF (=(get "HaveBuilderUI") "1")+]
	[CCode (instance_pos = -1)][+
  ENDIF+]
	public void on_destroy (Widget window) 
	{
		Gtk.main_quit();
	}

	static int main (string[] args) 
	{
		Gtk.init (ref args);
		var app = new Main ();

		Gtk.main ();
		
		return 0;
	}
}
[+INVOKE END-INDENT\+]
