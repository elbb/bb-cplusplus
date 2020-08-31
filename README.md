<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# # (e)mbedded (l)inux (b)uilding (b)locks - containerized C++ build and runtime environment

This building block provides a way to build, run, test and perform static code analysis of any C++ project in a containerized manner and offers:

-   C++ builder docker image
-   C++ runtime docker image
-   local and CI/CD build system
-   C++ Static Code Analyzer
-   C++ Unit Test with doctest

There is also an example that shows the usage with a 'hello world' application.

# Build

It is highly recommended to modify this building block for your needs. For the integration
into your project you should modify the builder and runtime Dockerfiles. 

The images can be created locally manually or e.g. via dobi (<https://github.com/dnephin/dobi>) or via concourse CI.

## Using dobi for local build

### Prerequisites

-   dobi (<https://github.com/dnephin/dobi>)
-   docker (<https://docs.docker.com/install/>)

### Using dobi

dobi should only be used via the `dobi.sh` script, because there important variables are set and the right scripts are included.

By default five dobi resources are predefined:

```sh
./dobi.sh build    # build the building block
./dobi.sh test     # run all tests
./dobi.sh analyze  # perform static code analyze of the building block
./dobi.sh version  # generate version informations
./dobi.sh deploy   # deploy the building block
```

## Using dobi for static code analysis

This building block offers the possibility to perform a static code analysis. The following tools and analyzers are used for the execution.

- CodeChecker
- Clang- Tidy
- Clang- Static Analyzer

The results are automatically provided to a CodeChecker web server for analysis. It is recommended to use the dev environment (<https://github.com/elbb/elbb-dev-environment>) provided by elbb.

**Notice:** Before start the code analysis, be sure that the CodeChecker Web Server is up and running.

With the following dobi command, the analysis of the sample code can be started:

```sh
./dobi.sh analyze
```

If you don't use the elbb dev environment, you can change the default CodeChecker URL and specific network name of storing the analyze results with the following dobi command:

```sh
CODECHECKER_URL=http://codechecker-web:8001/Default CODECHECKER_NET=elbb-dev ./dobi.sh analyze
```

## Using dobi for unit test

This building block offers the possibility to perform a unit test of your source code. The following tool is used for the execution.

<https://github.com/onqtam/doctest>

With the following dobi command, a example unit test of a sample code can be started:

```sh
./dobi.sh test
```

## Using concourse CI for a CI/CD build

The pipeline file must be uploaded to concourse CI via `fly`. 
Enter the build users ssh private key into the file `ci/credentials.template.yaml` and rename it to `ci/credentials.yaml`. 

**Note: `credentials.yaml` is ignored by `.gitignore` and will not be checked in.**

In further releases there will be a key value store to keep track of the users credentials.
Before setting the pipeline you might login first to your concourse instance `fly -t <target> login --concourse-url http://<concourse>:<port>`. See the [fly documentation](https://concourse-ci.org/fly.html) for more help.
Upload the pipeline file with fly:

    $ fly -t <target> set-pipeline -n -p bb-cplusplus -l ci/config.yaml -l ci/credentials.yaml -c pipeline.yaml

After successfully uploading the pipeline to concourse CI login and unpause it. After that the pipeline should be triggered by new commits on the master branch (or new tags if enabled in `pipeline.yaml`).

# What is embedded linux building blocks

embedded linux building blocks is a project to create reusable and
adoptable blueprints for highly recurrent issues in building an internet
connected embedded linux system.

# License

Licensed under either of

-   Apache License, Version 2.0, (./LICENSE-APACHE or <http://www.apache.org/licenses/LICENSE-2.0>)
-   MIT license (./LICENSE-MIT or <http://opensource.org/licenses/MIT>)

at your option.

# Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.

Copyright (c) 2020 conplement AG
