cmake_minimum_required(VERSION 3.10)

# Define the project
project(BasicOS C ASM)

# Add the startup assembly file and main C file
add_executable(kernel.elf ./src/boot/boot.S ./src/kernel/kernel.c)

# Set compile flags for C files
target_compile_options(kernel.elf PRIVATE
    $<$<COMPILE_LANGUAGE:C>:-ffreestanding>)

# Set flags for assembly files (empty, to ensure no incorrect flags are passed)
set_source_files_properties(boot.S PROPERTIES COMPILE_FLAGS "")

# Set linker flags only (with -nostdlib)
set_target_properties(kernel.elf PROPERTIES
    LINK_FLAGS "-nostdlib -ffreestanding -T linker.ld"
)

# Add the final build step to convert ELF to binary
add_custom_command(TARGET kernel.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary kernel.elf kernel8.img
    DEPENDS kernel.elf
    COMMENT "Generating kernel8.img"
)
