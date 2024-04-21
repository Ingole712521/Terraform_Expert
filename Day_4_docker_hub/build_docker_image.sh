# create a repository to store the docker image in docker hub

# launch an ec2 instance. open port 80 and port 22

# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user


# create a dockerfile
sudo cat Dockerfile 

# build the docker image
docker build -t nehal .

# login to your docker hub account
echo 'docker_password' | docker login --username nehal71 --password-stdin


# use the docker tag command to give the image a new name
sudo docker tag nehal nehal71/website:latest

# push the image to your docker hub repository
sudo docker push nehal71/website:latest

# start the container to test the image 
docker run -d -p 3000:3000 nehal:latest 

