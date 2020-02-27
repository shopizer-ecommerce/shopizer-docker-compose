# shopizer-aws-lightsail
# docker-compose aws
# docker-compose-gcp

Shopizer running on AWS Lightsail, the easiest way to quickstart an instance of Shopizer on AWS

  - In AWS Console
    - Create new LightSail instance
    - Select bloeprint OS Only
      - select Ubuntu server from the list, last version available is preferable
      - click on 'Add launch script' and copy content of [lightsail-install.sh](https://github.com/shopizer-ecommerce/shopizer-docker-compose/blob/master/lightsail-install.sh) in the text box
      - select an instance plan for a 4GB server (requires running the server, mysql and elastic)
      - ssh key pair create new
      - give a name to keypair (ie shopizer-lightsail)
      - download key and save pem file to a secure location
      - if you are on a mac or linux change mode on downloaded key file chmod 400 shopizer-lightsail.pem
      - create unique instance name (ie shopizer-docker-compose)
      - add key value tage Name = shopizer-docker-compose
      - click create instance

Creation process takes a while, instance status will indicate 'Running' when ready
Change firewall rules
- remove http port 80
- add Custom TCP port 8080

Download [docker-compose.yml](https://github.com/shopizer-ecommerce/shopizer-aws-lightsail/blob/master/docker-compose.yml)

cd to folder containing newly download pem file
```sh
scp -i shopizer-lightsail.pem docker-compose.yml ubuntu@<IP ADDRESS>:/home/ubuntu
ssh -i shopizer-lightsail.pem ubuntu@<IP ADDRESS>
sudo su - root
cp /home/ubuntu/docker-compose.yml /srv/docker/
cd /srv/docker
```

Start docker compose

```sh
sudo docker-compose -f /srv/docker/docker-compose.yml up -d
```
