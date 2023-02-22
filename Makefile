TESTS_ROOT ?= ./e2e-api-tests
VENDOR_DIR ?= ${TESTS_ROOT}/vendor
ARCH ?= amd64
MINIKUBE_IP ?= `minikube ip`

# Download required tools - venom testing tool and tackle CLI tool with dependencies
init:
	mkdir -p ${VENDOR_DIR}
	curl https://github.com/ovh/venom/releases/download/v1.1.0/venom.linux-${ARCH} -Lo ${VENDOR_DIR}/venom && chmod +x ${VENDOR_DIR}/venom
	curl https://raw.githubusercontent.com/konveyor/tackle2-hub/main/hack/tool/tackle -Lo ${VENDOR_DIR}/tackle && chmod +x ${VENDOR_DIR}/tackle
	python3 -m pip install pyyaml pycryptodome requests

# Setup local minikube with tackle - work in progress (TODO: enable auth)
# This is for local setup, CI uses shared github actions
setup:
	curl https://raw.githubusercontent.com/konveyor/tackle2-operator/main/hack/start-minikube.sh -Lo ${VENDOR_DIR}/start-minikube.sh  && chmod +x ${VENDOR_DIR}/start-minikube.sh
	curl https://raw.githubusercontent.com/konveyor/tackle2-operator/main/hack/install-tackle.sh -Lo ${VENDOR_DIR}/install-tackle.sh && chmod +x ${VENDOR_DIR}/install-tackle.sh
	${VENDOR_DIR}/start-minikube.sh && \
	${VENDOR_DIR}/install-tackle.sh

# Clean local minikube with tackle
clean:
	minikube delete || true

# Execute end-to-end testsuite
test-e2e:
	echo "url: http://${MINIKUBE_IP}" > ${TESTS_ROOT}/vendor/tackle-config.yml
	echo "username: \"admin\"" >> ${TESTS_ROOT}/vendor/tackle-config.yml
	echo "password: \"\"" >> ${TESTS_ROOT}/vendor/tackle-config.yml
	echo "encryption_passphase: \"ci-dummy-passphase\"" >> ${TESTS_ROOT}/vendor/tackle-config.yml
	cd ${TESTS_ROOT} && ./vendor/venom run developer/**/*.yml administrator/**/*.yml
