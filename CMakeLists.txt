cmake_minimum_required(VERSION 3.7.2)

# ---- project ----
include(.cmake/options.cmake)
include(.cmake/declare_project_targets.cmake)

# FIXME: change to match your project definition
project("initial-cpp" VERSION "2.7.0" LANGUAGES "C" "CXX"
  HOMEPAGE_URL "https://github.com/robertefry/initial-cpp"
  DESCRIPTION "An initial C++ project to source other projects from.")

set(CMAKE_CXX_STANDARD "20")

# Strongly encouraged to globally disable compiler extensions to avoid conflicts
# between -std=c++20 and -std=gnu++20 when -Wpedantic is enabled.
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_EXTENSIONS OFF)

# ---- add dependencies via CPM ----
# see https://github.com/cpm-cmake/CPM.cmake for more info
include(.cmake/get_cpm.cmake)
include(.cmake/declare_system_libraries.cmake)

# FIXME: change to match your project dependency requirements

CPMAddPackage(NAME "fmt"
  GITHUB_REPOSITORY "fmtlib/fmt" GIT_TAG "10.0.0"
  OPTIONS "FMT_INSTALL NO")
opt_declare_system_libraries(fmt::fmt fmt::fmt-header-only)

CPMAddPackage(NAME "Catch2"
  GITHUB_REPOSITORY "catchorg/Catch2" VERSION "3.3.2")
opt_declare_system_libraries(Catch2::Catch2 Catch2::Catch2WithMain)

# ---- project targets ----

# FIXME: change to match your project compilation units
add_subdirectory(project-lib)
add_subdirectory(project-bin)

# ---- project packaged targets ----
# this allows users to install and find the library via `find_package`.
CPMAddPackage("gh:TheLartians/PackageProject.cmake@1.11.0")

# FIXME: change to match your project packages
packageProject(
  NAME "project-lib"
  VERSION ${PROJECT_VERSION}
  NAMESPACE ${PROJECT_NAME}
  BINARY_DIR ${PROJECT_BINARY_DIR}
  COMPATIBILITY SameMajorVersion
)
