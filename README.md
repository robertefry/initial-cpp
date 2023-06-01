
# Initial CPP

Setting up a new C++ project usually requires more time than the endurance of ideas. Even more so for modern C++ projects which require static analysis checks, test suites, documentation, and a slew of other requirements. This template is here to streamline the process of beginning a new C++ project.

Heavily inspired by [cpp-best-practices](https://github.com/cpp-best-practices)'s [cmake_template](https://github.com/cpp-best-practices/cmake_template) and [cppbestpractices](https://github.com/cpp-best-practices/cppbestpractices).

## Features

* Conformant to [Modern CMake practices](https://pabloariasal.github.io/2018/02/19/its-time-to-do-cmake-right/).
* Total separation of project units (libraries, executables, etc...).
* Reproducible dependency management via [CPM.cmake](https://github.com/cpm-cmake/CPM.cmake).
* Integrated [Catch2](https://github.com/catchorg/Catch2) testing suite.
* Integrated LLVM linting via [clang-tidy](https://clang.llvm.org/extra/clang-tidy/).
* Integrated LLVM sanitizer checking.
* Installable targets via [PackageProject.cmake](https://github.com/TheLartians/PackageProject.cmake).

## Features In-Progress

* Continuous integration via [GitHub Actions](https://help.github.com/en/actions/).
* Code coverage via [codecov](https://codecov.io/).
* Code formatting enforced by [clang-format](https://clang.llvm.org/docs/ClangFormat.html).
* Automatic documentation via [Doxygen](https://www.doxygen.nl/).

# How do I use `initial-cpp`?

To add this build system to an already existing project, you will need to merge a version of initial-cpp into an appropriate local branch. Follow the steps below.

1. Add the `initial-cpp` remote to your project, here we call it `build`.
    ```
    $ git remote add build https://github.com/robertefry/initial-cpp
    ```

2. Fetch the version of initial-cpp you want to use, here we fetch the tag `v2.2.0` as `build-2.2.0`.
    ```
    $ git fetch --no-tags build refs/tags/v2.2.0:refs/tags/build-2.2.0
    ```

3. Finally, we merge this tag into the branch we have presently checked out.
    ```
    $ git merge --allow-unrelated-histories build-2.2.0
    ```

4. (Optionally), we can push the `build-2.2.0` tag to the project remote, here called `origin`.
    ```
    $ git push origin build-2.2.0
    ```
