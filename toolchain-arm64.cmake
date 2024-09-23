# toolchain-arm64.cmake
set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# Update the path to the correct Homebrew-installed cross-compiler
set(CMAKE_C_COMPILER /opt/homebrew/bin/aarch64-elf-gcc)
set(CMAKE_ASM_COMPILER /opt/homebrew/bin/aarch64-elf-as)
set(CMAKE_OBJCOPY /opt/homebrew/bin/aarch64-elf-objcopy)

# Define the build flags
set(CMAKE_C_FLAGS "-nostdlib -ffreestanding")
set(CMAKE_ASM_FLAGS "-nostdlib -ffreestanding")

