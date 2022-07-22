set(CMAKE_CXX_FLAGS_DEBUG "-fsanitize=address,undefined")

set(CMAKE_CXX_COMPILER "clang++")
set(CMAKE_C_COMPILER "clang")
set(CMAKE_CXX_STANDARD "20")

set(CMAKE_EXPORT_COMPILE_COMMANDS true)

add_compile_options(
	-fcolor-diagnostics
)
