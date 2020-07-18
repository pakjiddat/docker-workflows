export REPO_NAME="pakjiddat/nodejs:12.16.1"

# Save running container to image
sudo docker commit nodejs-apps $REPO_NAME

# Stop running container
sudo docker stop nodejs-apps
 
# Upload image to Docker Hub
sudo docker push $REPO_NAME

# Start the container
sudo docker start nodejs-apps
