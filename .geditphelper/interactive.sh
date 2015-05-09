#! /bin/sh
echo "starting interactive mode:"
if [ -n "$PNAME" ]; then
	read -p PNAME "Enter a name for your plugin"
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
			[p]* ) APPACT="true";;
			[w]* ) WINACT="true";;
			[v]* ) VIEACT="true";;
			*) echo "What kind of plugin p(AppActivatable)w(WindowActivatable)v(ViewActivatable)"
			esac
		    done
		fi
	fi
fi
echo "finished interactive mode"