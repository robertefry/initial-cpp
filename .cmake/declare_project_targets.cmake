
# The declare_project_target function sets up any additional options for the
# given target such that it adheres to the project specification.

include(.cmake/options.cmake)

function(declare_project_target target)
  target_enable_clang_tidy(${target})
endfunction()

function(declare_project_targets targets)
  foreach(target ${targets})
    declare_project_target(${target})
  endforeach()
endfunction()
