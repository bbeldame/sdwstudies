docker stop web
docker rm web
docker run -p 6969:80 --name web -v c:/dev/sdwstudies/algoavancee/game/:/var/www/html/ -d php:7.0.12-apache
