# Test fixtures and related utils

This directory contains reusable test steps (files ending ```...-test.yml```), set of executors wrapping Tackle Hub API (```executors``` directory) and directory ```dumps``` with JSON export of Hub API.

## Dumps

Directory contains exports of Hub API in JSON format. It is controlled by ```hub-fixture``` executor which uses https://github.com/konveyor/tackle2-hub/tree/main/hack/tool.

## Executors

Custom executor provide layer between test steps and the tested interface. There are default for common interface types like HTTP, CLI scripting, SQL and various messaging protocols and its customized versions wrapping it and aiming simplify their usage in test steps (like ```hub-api``` or ```hub-fixture-load|store```).

## Reusable test steps

Could be used as fixtures or a basic test steps.

Files should contain a structures to run  tests, but usually not a data which should be passed as ```input.*``` variables from a test scenario which is calling it.

Test steps might call customized (Tackle Hub API) or Venom default executors (HTTP, CLI command, etc.).

