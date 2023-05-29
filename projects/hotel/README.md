# Hotel Project 
## Docker Installation
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Setup Project

```bash
docker compose up -d
```


## PHPMyAdmin Access
http://127.0.0.1:8080

## Import sample data to mongodb

```bash
docker exec -i mongo mongoimport  --authenticationDatabase admin --username mongo_root_username --password mongo_root_password --db hotel_reserveation --collection reservations --drop --jsonArray --file /sample.json
```




docker exec -i your_mongodb_container_name mongoimport --db your_database_name --collection your_collection_name --drop --jsonArray --file /path/to/reservations.json