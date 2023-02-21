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
