# geditpluginhelper
Helper for creating gedit plugin projects.

A script which generates a skeleton gedit plugin project.

        usage: Gedit Plugin Helper can be used interactively, by passing 
        parameters, or by passing some parameters and interactively entering 
        other parameters.
                --n The name of the project. Module name will be module_$NAME
                --d A brief description of the project
                --a The name of the project creator
                --c Additional copyright info for plugin file (Optional)
                --s Web site for the plugin/author
                --h display this message
                --p AppActivatable Plugin
                --w WindowActivatable Plugin
                --v ViewActivatable Plugin

Passing the script with no arguments will prompt you for input. Everything is 
done from the current working directory. Project files will be created in folder
--name