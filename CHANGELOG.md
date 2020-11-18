# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

-  added a "howto remote target debugging"
-  add docker user/password for all docker images used for concourse ci

## [0.2.1] 2020.Q4

-  Fix compiling with conan for aarch64 and armv7

## [0.2.0] 2020.Q4

-  added versioning output for hello world service
-  updated ci pipeline tagging (reintegrated bb-buildingblock)
-  added static code analyse environment(CodeChecker, clang-sa, clang-tidy)
-  default compiler/linker settings for cplusplus_service
-  added doctest and a unit test example
-  added doxygen to generate source code documentation
-  added gdbserver to start debugging the hello world service
-  removing generation of builder and runtime images
-  added email notification for concourse ci
-  armv7 + aarch64 support
-  added `default.env`, `local.env.template` and doku how to use it -> enables setting default and local environment variables for `dobi` targets
-  bb-gitversion version bump to 0.7.0

## [0.1.0] - 2020-06-08

Initial Version

### Added

-   C++ builder and runtime images for x86_64
-   'hello world' service example
-   concourse environment for ci/cd builds
-   dobi environment for local builds
-   automated versioning with elbb/bb-gitversion 0.5.0
-   integrated bb-buildingblock 0.2.1
