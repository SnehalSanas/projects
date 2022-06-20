# Lohono Stay Availability API
## Prerequisite
* Docker (https://docs.docker.com/engine/install/binaries/)
* Git (https://www.atlassian.com/git/tutorials/install-git)
* curl

## Steps to Follow
1. Run following command to to clone repository
    
    git clone https://github.com/SnehalSanas/projects.git
    
2. In Home directory, run following command to run api. it will create to container one for mysql and another for app.
    
    docker-compose up
    
3.  You can run followin command to test our API
    
    ```
4. if you want to login on mysql docker
    
    docker ps # find container id
    docker exec -it <containerid> sh 
    # please find db creditials in docker-compose file

5.CURL
    