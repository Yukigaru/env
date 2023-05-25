skip file bits/basic_string.h
skip file bits/basic_string.tcc
skip file bits/move.h
skip file bits/unique_ptr.h
skip file bits/shared_ptr.h
skip file bits/shared_ptr_base.h
skip file bits/unordered_map.h
skip file bits/stl_deque.h
skip file smart_ptr/intrusive_ptr.hpp
skip file __memory/unique_ptr.h
skip file __memory/compressed_pair.h
skip file bits/stl_map.h
skip file bits/stl_tree.h
skip file bits/stl_vector.h
skip file intrusive/list.hpp
skip file detail/list_iterator.hpp
skip file c++/11/optional
skip file c++/11/chrono
skip file c++/11/string_view
skip file bits/alloc_traits.h
skip file __memory/shared_ptr.h
skip file rapidjson/document.h

# libc++
skip file v1/vector
skip file v1/string_view
skip file v1/string
skip file v1/type_traits
skip file v1/__utility/forward.h
skip file v1/__utility/move.h
skip file v1/__functional/invoke.h



set confirm off
set verbose off
set history filename ~/.gdb_history
set history save

# These make gdb never pause in its output
set height 0
set width 0

# _____________breakpoint aliases_____________
define bpl
    info breakpoints
end
document bpl
Syntax: bpl
| List all breakpoints.
end


define bp
    if $argc != 1
        help bp
    else
        break $arg0
    end
end
document bp
Syntax: bp LOCATION
| Set breakpoint.
| LOCATION may be a line number, function name, or "*" and an address.
| To break on a symbol you must enclose symbol name inside "".
| Example:
| bp "[NSControl stringValue]"
| Or else you can use directly the break command (break [NSControl stringValue])
end


define bpc
    if $argc != 1
        help bpc
    else
        clear $arg0
    end
end
document bpc
Syntax: bpc LOCATION
| Clear breakpoint.
| LOCATION may be a line number, function name, or "*" and an address.
end


define bpe
    if $argc != 1
        help bpe
    else
        enable $arg0
    end
end
document bpe
Syntax: bpe NUM
| Enable breakpoint with number NUM.
end


define bpd
    if $argc != 1
        help bpd
    else
        disable $arg0
    end
end
document bpd
Syntax: bpd NUM
| Disable breakpoint with number NUM.
end


define bpt
    if $argc != 1
        help bpt
    else
        tbreak $arg0
    end
end
document bpt
Syntax: bpt LOCATION
| Set a temporary breakpoint.
| This breakpoint will be automatically deleted when hit!.
| LOCATION may be a line number, function name, or "*" and an address.
end


define bpm
    if $argc != 1
        help bpm
    else
        awatch $arg0
    end
end
document bpm
Syntax: bpm EXPRESSION
| Set a read/write breakpoint on EXPRESSION, e.g. *address.
end


define bhb
    if $argc != 1
        help bhb
    else
        hb $arg0
    end
end
document bhb
Syntax: bhb LOCATION
| Set hardware assisted breakpoint.
| LOCATION may be a line number, function name, or "*" and an address.
end


define bht
    if $argc != 1
        help bht
    else
        thbreak $arg0
    end
end
document bht
Usage: bht LOCATION
| Set a temporary hardware breakpoint.
| This breakpoint will be automatically deleted when hit!
| LOCATION may be a line number, function name, or "*" and an address.
end


# ______________process information____________
define argv
    show args
end
document argv
Syntax: argv
| Print program arguments.
end


define stack
    if $argc == 0
        info stack
    end
    if $argc == 1
        info stack $arg0
    end
    if $argc > 1
        help stack
    end
end
document stack
Syntax: stack <COUNT>
| Print backtrace of the call stack, or innermost COUNT frames.
end


define frame
    info frame
    info args
    info locals
end
document frame
Syntax: frame
| Print stack frame.
end


define var
    if $argc == 0
        info variables
    end
    if $argc == 1
        info variables $arg0
    end
    if $argc > 1
        help var
    end
end
document var
Syntax: var <REGEXP>
| Print all global and static variable names (symbols), or those matching REGEXP.
end


define lib
    info sharedlibrary
end
document lib
Syntax: lib
| Print shared libraries linked to target.
end


define sig
    if $argc == 0
        info signals
    end
    if $argc == 1
        info signals $arg0
    end
    if $argc > 1
        help sig
    end
end
document sig
Syntax: sig <SIGNAL>
| Print what debugger does when program gets various signals.
| Specify a SIGNAL as argument to print info on that signal only.
end


define threads
    info threads
end
document threads
Syntax: threads
| Print threads in target.
end


define dis
    if $argc == 0
        disassemble
    end
    if $argc == 1
        disassemble $arg0
    end
    if $argc == 2
        disassemble $arg0 $arg1
    end
    if $argc > 2
        help dis
    end
end
document dis
Syntax: dis <ADDR1> <ADDR2>
| Disassemble a specified section of memory.
| Default is to disassemble the function surrounding the PC (program counter) of selected frame.
| With one argument, ADDR1, the function surrounding this address is dumped.
| Two arguments are taken as a range of memory to dump.
end


# __________hex/ascii dump an address_________
define ascii_char
    if $argc != 1
        help ascii_char
    else
        # thanks elaine :)
        set $_c = *(unsigned char *)($arg0)
        if ($_c < 0x20 || $_c > 0x7E)
            printf "."
        else
            printf "%c", $_c
        end
    end
end
document ascii_char
Syntax: ascii_char ADDR
| Print ASCII value of byte at address ADDR.
| Print "." if the value is unprintable.
end


define hex_quad
    if $argc != 1
        help hex_quad
    else
        printf "%02X %02X %02X %02X %02X %02X %02X %02X", \
               *(unsigned char*)($arg0), *(unsigned char*)($arg0 + 1),     \
               *(unsigned char*)($arg0 + 2), *(unsigned char*)($arg0 + 3), \
               *(unsigned char*)($arg0 + 4), *(unsigned char*)($arg0 + 5), \
               *(unsigned char*)($arg0 + 6), *(unsigned char*)($arg0 + 7)
    end
end
document hex_quad
Syntax: hex_quad ADDR
| Print eight hexadecimal bytes starting at address ADDR.
end


define hexdump
    if $argc == 1
        hexdump_aux $arg0
	else
		if $argc == 2
			set $_count = 0
			while ($_count < $arg1)
				set $_i = ($_count * 0x10)
				hexdump_aux $arg0+$_i
				set $_count++
			end
		else
			help hexdump
		end
    end
end
document hexdump
Syntax: hexdump ADDR <NR_LINES>
| Display a 16-byte hex/ASCII dump of memory starting at address ADDR.
| Optional parameter is the number of lines to display if you want more than one.
end


define hexdump_aux
    if $argc != 1
        help hexdump_aux
    else
    	color_bold
        printf "0x%016lX : ", $arg0
        color_reset
        hex_quad $arg0
        color_bold
        printf " - "
        color_reset
        hex_quad $arg0+8
        printf " "
        color_bold
        ascii_char $arg0+0x0
        ascii_char $arg0+0x1
        ascii_char $arg0+0x2
        ascii_char $arg0+0x3
        ascii_char $arg0+0x4
        ascii_char $arg0+0x5
        ascii_char $arg0+0x6
        ascii_char $arg0+0x7
        ascii_char $arg0+0x8
        ascii_char $arg0+0x9
        ascii_char $arg0+0xA
        ascii_char $arg0+0xB
        ascii_char $arg0+0xC
        ascii_char $arg0+0xD
        ascii_char $arg0+0xE
        ascii_char $arg0+0xF
        color_reset
        printf "\n"
    end
end
document hexdump_aux
Syntax: hexdump_aux ADDR
| Display a 16-byte hex/ASCII dump of memory at address ADDR.
end


# _______________data window__________________
define ddump
    if $argc != 1
        help ddump
    else
        printf "[0x%04X:0x%016lX]", $ds, $data_addr
    	printf "------------------------"
        printf "-------------------------------"
        printf "-------------------------------------"
	    color_bold
	    printf "[data]\n"
        color_reset
        set $_count = 0
        while ($_count < $arg0)
            set $_i = ($_count * 0x10)
            hexdump $data_addr+$_i
            set $_count++
        end
    end
end
document ddump
Syntax: ddump NUM
| Display NUM lines of hexdump for address in $data_addr global variable.
end


define dd
    if $argc != 1
        help dd
    else
        set $data_addr = $arg0
        ddump 0x10
    end
end
document dd
Syntax: dd ADDR
| Display 16 lines of a hex dump of address starting at ADDR.
end

# _______________process control______________
define n
    if $argc == 0
        nexti
    end
    if $argc == 1
        nexti $arg0
    end
    if $argc > 1
        help n
    end
end
document n
Syntax: n <NUM>
| Step one instruction, but proceed through subroutine calls.
| If NUM is given, then repeat it NUM times or till program stops.
| This is alias for nexti.
end


define go
    if $argc == 0
        stepi
    end
    if $argc == 1
        stepi $arg0
    end
    if $argc > 1
        help go
    end
end
document go
Syntax: go <NUM>
| Step one instruction exactly.
| If NUM is given, then repeat it NUM times or till program stops.
| This is alias for stepi.
end



define init
    tbreak _init
    r
end
document init
Syntax: init
| Run program and break on _init().
end


define start
    tbreak _start
    r
end
document start
Syntax: start
| Run program and break on _start().
end


define sstart
    tbreak __libc_start_main
    r
end
document sstart
Syntax: sstart
| Run program and break on __libc_start_main().
| Useful for stripped executables.
end


define main
    tbreak main
    r
end
document main
Syntax: main
| Run program and break on main().
end


define search
    set $start = (char *) $arg0
    set $end = (char *) $arg1
    set $pattern = (short) $arg2
    set $p = $start
    while $p < $end
        if (*(short *) $p) == $pattern
            printf "pattern 0x%hx found at 0x%x\n", $pattern, $p
        end
        set $p++
    end
end
document search
Syntax: search <START> <END> <PATTERN>
| Search for the given pattern beetween $start and $end address.
end
