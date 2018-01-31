docker stop test1 && docker rm test1
docker run -d \
	--cpuset-cpus 0-29 \
	--name test1 \
	-v /root/docker/build/docker-automated-build.builder-ubuntu-android-sdk/etc/nginx:/etc/nginx:ro \
	-v /root/docker/build/docker-automated-build.builder-ubuntu-android-sdk/www:/usr/share/nginx/html \
       	-p 23:22 \
	-p 8081:80 \
	zapbranigan/server-lamp-nginx-ftp:latest
