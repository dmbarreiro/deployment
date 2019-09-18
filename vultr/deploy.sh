echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USERNAME --password-stdin
docker pull $IMAGE_NAME:$IMAGE_TAG
docker stop appointments-back
docker rm appointments-back
docker run -d -p 3000:3000 --name=appointments-back --env-file ~/appointments-back/.env --restart=always -v ~/appointments-back/app $IMAGE_NAME:$IMAGE_TAG
service nginx reload
