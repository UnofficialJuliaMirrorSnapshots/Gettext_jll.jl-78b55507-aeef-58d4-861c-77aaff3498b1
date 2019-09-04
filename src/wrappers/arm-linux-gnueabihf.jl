# Autogenerated wrapper script for Gettext_jll for arm-linux-gnueabihf
export libgettext

using Libiconv_jll
## Global variables
const PATH_list = String[]
const LIBPATH_list = String[]
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libgettext`
const libgettext_splitpath = ["lib", "libgettextlib-0.20.1.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgettext_path = ""

# libgettext-specific global declaration
# This will be filled out by __init__()
libgettext_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgettext = "libgettextlib-0.20.1.so"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    append!(PATH_list, Libiconv_jll.PATH_list)
    append!(LIBPATH_list, Libiconv_jll.LIBPATH_list)
    global libgettext_path = abspath(joinpath(artifact"Gettext", libgettext_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgettext_handle = dlopen(libgettext_path)
    push!(LIBPATH_list, dirname(libgettext_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

