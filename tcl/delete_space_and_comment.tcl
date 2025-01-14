proc delete_space_and_comment {file0} {
	set fh 		[open $file0 r]
	set fh_tmp	[open ${file0}_tmp.v w]
	while {[gets $fh line] >= 0} {
		set line [regsub -all {\/\/.*} $line ""] 
		set line [regsub {^\s*$} $line ""]
		set line [regsub {^$\n} $line ""]
		if { $line ne "" } {
			puts $fh_tmp $line
		}
	}
	close $fh
	close $fh_tmp
}