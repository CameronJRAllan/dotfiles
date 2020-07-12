layout src

set print array on
set print pretty on
set max-value-size 999999
source $HOME/gdb-helpers/load-helpers.py

define bpl
    info breakpoints
end
document bpl
List all breakpoints.
end

define bpm
    if $argc != 1
        help bpm
    else
        awatch $arg0
    end
end
document bpm
Set a read/write breakpoint on EXPRESSION, e.g. *address.
Usage: bpm EXPRESSION
end
