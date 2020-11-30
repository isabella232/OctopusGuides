attempt_counter=0
max_attempts=10

echo "Waiting for the Octopus server"

until $(curl --max-time 5 --output /dev/null --silent --head --fail http://localhost); do
    if [ ${attempt_counter} -eq ${max_attempts} ];then
      echo "Max attempts reached"
      docker logs octopusdeploy
      docker logs mssql
      journalctl -u docker-octopusdeploy.service
      journalctl -u docker-mssql.service
      exit 1
    fi

    printf 'Sleeping...'
    attempt_counter=$(($attempt_counter+1))
    sleep 60

    # The database sometimes fails us, so do a hard reset of the database container
    systemctl stop docker-octopusdeploy
    docker stop mssql
    docker rm mssql
    systemctl restart docker-mssql
    systemctl start docker-octopusdeploy
done

exit 0