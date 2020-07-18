export REPO_NAME="pakjiddat/lamp:1.0"

# Save running container to image
sudo docker commit lamp-apps $REPO_NAME

# Stop running container
sudo docker stop lamp-apps
 
# Upload image to Docker Hub
sudo docker push $REPO_NAME

# Start the container
sudo docker start lamp-apps
