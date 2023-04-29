#cada vez que se faz o up tem de se alterar estas permissões aos volumes para que o sitema consiga utilizar as folders
#o rm apaga toda a informação
sudo rm -rf /home/ncameiri/data/wordpress/*
sudo rm -rf /home/ncameiri/data/mariadb/*
docker volume rm srcs_volume_mariadb
docker volume rm srcs_volume_wordpress
sudo chmod -R 777 /home/ncameiri/data
sudo chown -R ncameiri:ncameiri /home/ncameiri/data
