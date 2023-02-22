# konveyor-ci-playground
Playground for upstream CI experiments.

## CI status

[![End-To-End API Test](https://github.com/aufi/konveyor-ci-playground/actions/workflows/e2e-api-test.yml/badge.svg?branch=main)](https://github.com/aufi/konveyor-ci-playground/actions/workflows/e2e-api-test.yml)

### Components status

[![Test Windup Addon](https://github.com/konveyor/tackle2-addon-windup/actions/workflows/test-windup.yml/badge.svg?branch=main)](https://github.com/konveyor/tackle2-addon-windup/actions/workflows/test-windup.yml)

Add more components with their unit/integration tests execution status.

## Local test suite execution

### Clone this repo

```
git clone https://github.com/aufi/konveyor-ci-playground && cd konveyor-ci-playground
```

### Prepare environment

```
$ make init # populate "e2e-api-tests/vendor" directory with required tools

$ make setup # start minikube&tackle using David's scripts - local env only
```

### Run tests

```
$ make test-e2e
```

### Check results

See console output first. More details about tests execution and results are stored in files in ```e2e-api-tests/output``` directory and ```venom.log``` file.

## Notes

### CI next steps/TODOs proposal

- Fully implement QE-provided sanity test scenarios
- Setup Tackle with auth enabled (and potentialy multiple users with different roles)
- Extend for relevant non-main branches

### Notes about Venom

Notes below are Marek's personal thoughts, might not be universaly true.

Main points are that **tests are bunch of YAML files** (have pros and cons) and it is not possible write everything what comes to mind like in plain Golang or Python, but using provided way how to proceed with integration testing (longterm, this should be an advantage IMO).

Nice things
- Concept of Test <- (reusable) fixtures/custom executors <- Venom executors.
- Extensive debugging output in test ```output``` directory allows looking to test steps details including its variable values after the test (potentialy) failed.
- Venom is designed to be integration testing tool, so brings concepts like split test definition, execution and is easily extendable.
- The tool is written in golang and allows create own executors natively in golang (this might be needed for rather complex or somehow very uncommon tests, is working well even without it).
- Compromise on sharing zero code with tested tool, but providing reasonably understandable interface working with it (a thin wrapper on tested API).
- Tackle CLI integration as a custom executor allows load/store fixture dumps quickly (within features of export/import, e.g. no Tasks).

Not so nice things
- YAML doesn't look as nice as golang source code (at least for me as developer).
- YAML and templating system is sometimes awkward and tricky for engineers not used for it (intendation of comments matters, " vs ', >- vs {...\n}, etc. venom extension for VS Code might help there).
- Assertions doesn't allow do a non-trivial operations with tested value, instead the expected value could be modified as needed and assertions can be put to AND/OR condition trees. Likely it is a design, but I haven't started like it so far.

Venom docs on concepts and usage: https://github.com/ovh/venom#readme

Relevant information comes also from [closed issues](https://github.com/ovh/venom/issues?q=is%3Aissue+is%3Aclosed) on their repo - people asking things that they didn't understood how Venom solves (was helpful for me).
