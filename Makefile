.PHONY: build clean deploy

build:
	docker build --no-cache -t gcr.io/instana-solution-architects/node-app:v3 node-app
	docker push gcr.io/instana-solution-architects/node-app:v3

deploy:
	kubectl apply -f k8s/deployment.yaml
	kubectl apply -f k8s/service.yaml

clean:
	kubectl delete -f k8s/deployment.yaml
	kubectl delete -f k8s/service.yaml

