# konveyor-ci-playground
Playground for upstream CI experiments to understand it as much as possible before building it.

## Test suite execution

### Clone this repo

```
git clone https://github.com/aufi/konveyor-ci-playground && konveyor-ci-playground
```

### Prepare environment

```
$ make init # populated "vendor" directory with required tools

$ #TODO: make setup # start minikube&tackle using David's scripts
```

### Run tests

```
$ make test-e2e
```

### Check results

See console output first. More details about tests execution and results are stored in files in ```output``` directory and ```venom.log``` file.


## Notes

```
[maufart@nb konveyor-ci-playground]$ cd venom-api-tests/
[maufart@nb venom-api-tests]$ venom run developer/applications-inventory/applications.yml 
          [trac] writing output/venom.0.log
 • Applications (developer/applications-inventory/applications.yml)
        • ApplicationCRUD
                • Create an application PASS
                • Get the application PASS
                • Update the application PASS
                • Get the updated application PASS
                • Cleanup the application PASS
                  [info] Got app_id {{.app_id}}
                  [info] Querying POST applications with body: { "name": "tackle-testapp", "identities": [], "repository": { "kind": "git", "url": "https://github.com/konveyor/tackle-testapp" } } (lib/hub-api-executor.yml:18)
                  [info] Got response 201: {"id":1,"createUser":"admin.noauth","updateUser":"","createTime":"2023-02-15T16:13:53.67224492Z","name":"tackle-testapp","description":"","bucket":"/buckets/a8de4719-573f-4af3-95fc-8d55ac86372f","repository":{"kind":"git","url":"https://github.com/konveyor/tackle-testapp","branch":"","tag":"","path":""},"binary":"","facts":{},"review":null,"comments":"","identities":[],"tags":null,"businessService":null} (lib/hub-api-executor.yml:20)
                  [info] Querying GET applications/1 with body: {} (lib/hub-api-executor.yml:18)
                  [info] Got response 200: {"id":1,"createUser":"admin.noauth","updateUser":"","createTime":"2023-02-15T16:13:53.67224492Z","name":"tackle-testapp","description":"","bucket":"/buckets/a8de4719-573f-4af3-95fc-8d55ac86372f","repository":{"kind":"git","url":"https://github.com/konveyor/tackle-testapp","branch":"","tag":"","path":""},"binary":"","facts":{},"review":null,"comments":"","identities":[],"tags":null,"businessService":null} (lib/hub-api-executor.yml:20)
                  [info] Querying PUT applications/1 with body: {"name": "tackle-testapp-updated"} (lib/hub-api-executor.yml:18)
                  [info] Got response 204:  (lib/hub-api-executor.yml:20)
                  [info] Querying GET applications/1 with body: {} (lib/hub-api-executor.yml:18)
                  [info] Got response 200: {"id":1,"createUser":"admin.noauth","updateUser":"admin.noauth","createTime":"2023-02-15T16:13:53.67224492Z","name":"tackle-testapp-updated","description":"","bucket":"/buckets/a8de4719-573f-4af3-95fc-8d55ac86372f","repository":null,"binary":"","facts":{},"review":null,"comments":"","identities":[],"tags":null,"businessService":null} (lib/hub-api-executor.yml:20)
                  [info] Querying DELETE applications/1 with body: {} (lib/hub-api-executor.yml:18)
                  [info] Got response 204:  (lib/hub-api-executor.yml:20)
                  [trac] writing output/applications.ApplicationCRUD.step.0.0.dump.json
                  [trac] writing output/applications.ApplicationCRUD.step.1.0.dump.json
                  [trac] writing output/applications.ApplicationCRUD.step.2.0.dump.json
                  [trac] writing output/applications.ApplicationCRUD.step.3.0.dump.json
                  [trac] writing output/applications.ApplicationCRUD.step.4.0.dump.json
Writing file output/test_results_developer_applications-inventory_applications.json
final status: PASS
```