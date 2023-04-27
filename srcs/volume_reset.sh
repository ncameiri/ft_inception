#cada vez que se faz o up tem de se alterar estas permissões aos volumes para que o sitema consiga utilizar as folders
#o rm apaga toda a informação
sudo rm -rf requirements/mariadb/data/*
sudo rm -rf requirements/wordpress/data/*
docker volume rm srcs_volume_mariadb
docker volume rm srcs_volume_worpdress
sudo chmod -R 777 requirements/mariadb/data
sudo chown -R nuno requirements/mariadb/data
sudo chmod -R 777 requirements/wordpress/data
sudo chown -R nuno requirements/wordpress/data