# set(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=lld -lc++abi -stdlib=libc++")
set(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=lld")

set(CMAKE_CXX_COMPILER "clang++")
set(CMAKE_C_COMPILER "clang")
set(CMAKE_CXX_STANDARD "17")
set(CMAKE_CXX_EXTENSIONS off)

set(CMAKE_CXX_FLAGS_DEBUG "-fsanitize=address,undefined")

add_compile_options(
	-Wall -pedantic -Wextra
)

set(CMAKE_EXPORT_COMPILE_COMMANDS true)