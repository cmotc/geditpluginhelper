#! /bin/bash
HELP="
A script which generates a skeleton gedit plugin project. \n

usage: Gedit Plugin Helper can be used interactively, by passing parameters, or \n
by passing some parameters and interactively entering other parameters. \n
	--n The name of the project. Module name will be module_\$NAME \n
	--d A brief description of the project \n
	--a The name of the project creator \n
	--c Additional copyright info for plugin file (Optional) \n
	--s Web site for the plugin/author \n
	--h display this message \n
	--p AppActivatable Plugin \n
	--w WindowActivatable Plugin \n
	--v ViewActivatable Plugin \n
"
#Unset all variables used in this script
unset PNAME
unset DESCRIPTION
unset AUTHORS
unset COPYRIGHT
unset WEBSITE
unset APPACT
unset WINACT
unset VIEACT

while getopts n:d:a:c:s:h:pwv params
do
	case "${params}"
	in
		name|n) PNAME=${OPTARG};;
		desc|d) DESCRIPTION=${OPTARG};;
		auth|a) AUTHORS=${OPTARG};;
		copy|c) COPYRIGHT=${OPTARG};;
		site|s) WEBSITE=${OPTARG};;
		p) APPACT="true";;
		w) WINACT="true";;
		v) VIEACT="true";;
		help|h) echo -e $HELP;;
	esac
done
echo -e $HELP

echo '-------------------------------------------------------------------------'
./.geditphelper/interactive.sh
mkdir -p $PNAME
cd $PNAME

echo "[Plugin]
Loader=python
Module=module_$PNAME
IAge=3
Name=$PNAME
Description=$DESDCRIPTION
Authors=$AUTHORS
Copyright=Copyright © $AUTHORS $COPYRIGHT
Website=$WEBSITE
Version=3.0.0" > $PNAME.plugin

#if [$APPACT=="true"]; then
#
#fi
#if [$WINACT=="true"]; then
#	
#fi
#if [$VIEACT=="true"]; then
#	source .geditphelper/
#fi
