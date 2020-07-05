#!/bin/bash

nicks="test, test_"
username="test"
realname="test"
server_name="test"
server_address="test.com"
port="6667"
msg_part=""
msg_quit=""

ctcp_clientinfo=""
ctcp_finger=""
ctcp_source=""
ctcp_time=""
ctcp_userinfo=""
ctcp_version=""
ctcp_ping=""


command_list=("/server add $server_name \"$server_address/$port\";"\
    "/set irc.server.$server_name.nicks \"$nicks\";"\
    "/set irc.server.$server_name.username \"$username\";"\
    "/set irc.server.$server_name.realname \"$realname\";"\
    "/set irc.server_default.msg_part \"\";"\
    "/set irc.server_default.msg_quit \"\";"\
    "/set irc.ctcp.clientinfo \"$ctcp_clientinfo\";"\
    "/set irc.ctcp.finger \"$ctcp_finger\";"\
    "/set irc.ctcp.source \"$ctcp_source\";"\
    "/set irc.ctcp.time \"$ctcp_time\";"\
    "/set irc.ctcp.userinfo \"$ctcp_userinfo\";"\
    "/set irc.ctcp.version \"$ctcp_version\";"\
    "/set irc.ctcp.ping \"$ctcp_ping\";"\
    "/plugin unload xfer;"\
    "/set weechat.plugin.autoload \"*,!xfer\";")
                            
run_command=""

len=${#command_list[@]}

for (( i=1; i<${len}+1; i++ )); do
    run_command=$run_command${command_list[$i-1]}
done

weechat --run-command "$run_command"
