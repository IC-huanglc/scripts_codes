proc read_two_line {file0} {
	set first 0
	set line_last ""
    set fh_tmp [open ${file0}_tmp.v r]
    set fh_tmp_tmp [open ${file0}_tmp_tmp.v w]
    while {[gets $fh_tmp line] >= 0} {
            if {$first == 0 && [regexp {^\s*\t*\)\s*;} $line]} {
                    set first 1
                    set line_last ${line_last}${line}
                    puts "line_last = $line_last"
                    set line [regsub {,\s*\t*\)\s*;} $line_last ");"]
					
					#上一行的需要注释
					set line_last "\/\/$line_last"
            }
			puts $fh_tmp_tmp $line_last
			set line_last $line
    }
	
	puts $fh_tmp_tmp "endmodule"
    close $fh_tmp
    close $fh_tmp_tmp
}