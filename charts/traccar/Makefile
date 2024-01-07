generate-template:
	rm -rf ./manifests || true
	helm template test-values . -f ./ci/test-values.yaml --namespace default --output-dir ./manifests/test-test --include-crds
	helm template traccar-default . -f values.yaml --namespace default --output-dir ./manifests/traccar-default --include-crds
	helm template traccar-redis-ha . -f ./ci/ha-with-redis-values.yaml --namespace default --output-dir ./manifests/traccar-redis-ha --include-crds
