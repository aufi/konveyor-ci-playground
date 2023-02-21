TESTS_ROOT ?= ./e2e-api-tests
VENDOR_DIR ?= ${TESTS_ROOT}/vendor
ARCH ?= amd64

# Download required tools from other repos
init:
	mkdir -p ${VENDOR_DIR}
	curl https://github.com/ovh/venom/releases/download/v1.1.0/venom.linux-${ARCH} -Lo ${VENDOR_DIR}/venom && chmod +x ${VENDOR_DIR}/venom
	curl https://raw.githubusercontent.com/konveyor/tackle2-hub/main/hack/tool/tackle -Lo ${VENDOR_DIR}/tackle && chmod +x ${VENDOR_DIR}/tackle
	curl https://raw.githubusercontent.com/konveyor/tackle2-operator/main/hack/start-minikube.sh -Lo ${VENDOR_DIR}/start-minikube.sh  && chmod +x ${VENDOR_DIR}/start-minikube.sh 
	curl https://raw.githubusercontent.com/konveyor/tackle2-operator/main/hack/install-tackle.sh -Lo ${VENDOR_DIR}/install-tackle.sh && chmod +x ${VENDOR_DIR}/install-tackle.sh

# Setup local minikube with tackle
setup:
	# TODO
	exit 1

# Execute end-to-end testsuite
test-e2e:
	cd ${TESTS_ROOT} && ./vendor/venom run developer/**/*.yml administrator/**/*.yml