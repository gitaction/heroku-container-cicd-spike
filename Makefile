APP_NAME = heroku-container-cicd-spike

build:
	docker-compose build $(APP_NAME)

push:
	./docker-push-to-heroku.sh

deploy:
	./heroku-deploy.sh

deploy:
	heroku open -a $(APP_NAME)
