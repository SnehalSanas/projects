# Lohono Stay Availability API
## Prerequisite
* Docker (https://docs.docker.com/engine/install/binaries/)
* Git (https://www.atlassian.com/git/tutorials/install-git)
* curl

## Steps to Follow
1. Run following command to to clone repository
    ```
    git clone https://github.com/SnehalSanas/projects.git
    ```
2. Open new terminal, and go to project's Home directory, run following command to run api. it will create two container, one for mysql and another for app.
    ```
    docker-compose build && docker-compose up  
    # it will take some time to start as it is building a project and creating docker file
    # app might fail multiple time util db is up.
    ```
3.  **You can run followin command to test our API**
    API to list villas which denotes average price per night and availability of the villa for entered dates. This API should also sort by price and availability depending upon queryparameters
    ```
    curl --location --request GET 'http://localhost:3000/v1/villas?offset=0&limit=100&sort_by=price&from=2021-01-01&to=2021-01-02' \--header 'Content-Type: application/json'
    ```
    API to calculate the total rate along with availability of a given villa for entered dates. Please get villa id from above api.
    ```
    curl --location --request GET 'http://localhost:3000/v1/villas/<villaid>/get_rates?from=2021-01-01&to=2021-01-02&offset=0&limit=100' \--header 'Content-Type: application/json'
    ```
4. if you want to login on mysql docker
    ```
    docker ps # find container id
    docker exec -it <containerid> sh 
    # please find db creditials in docker-compose file
    ```
5. Use ctrl + c to stop the docker and execute `docker-compose down`
    