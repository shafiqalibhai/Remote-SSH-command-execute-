proc sshExec {uname hostname passwd command} {
log_user 0
	spawn ssh "$uname@$hostname" $command
	expect { "*assword:*" { }
		 timeout {
			puts "timed out :("
			exit -1
		 }
	}
	exp_send "$passwd\r"
	set accum {}
	log_user 1
	expect {
		-regexp {.*\$} {
		#store output from bash process in variable accum
		set accum "$expect_out(buffer)" 
		exp_continue
	    	}
	}
	puts $accum
}
