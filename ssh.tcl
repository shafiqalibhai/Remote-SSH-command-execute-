#!/usr/bin/expect

package require Expect

source definitions.tcl

set uname "root"
set passwd "Success123!"
#set command "echo \$\(hostname\); echo ifconfig \-a \| grep inet \| grep \-v \'127.0.0.1\' \| awk \'{ print \$2} \';"
set command "echo \$\(hostname\);"

set f [open ip_list.txt]
while {1} {
    set hostname [gets $f]
    if {[eof $f]} {
        close $f
        break
    }
    sshExec $uname $hostname $passwd $command
    puts $hostname
    puts "====================================="
}
