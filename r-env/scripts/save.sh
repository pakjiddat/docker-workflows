export REPO_NAME="pakjiddat/r-env:3.6.3"

sudo docker commit r-env $REPO_NAME

# Save running container to image
sudo docker commit r-env $REPO_NAME

# Stop running container
sudo docker stop r-env
 
# Upload image to Docker Hub
sudo docker push $REPO_NAME
