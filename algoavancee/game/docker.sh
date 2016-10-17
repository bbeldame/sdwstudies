#!/bin/bash

port=80
path="c:/dev/sdwstudies"
name="web"

function usage(){
	printf "\nUtilisation du script :\n"
	printf "\t--port                       : changement du port par défaut : 80\n"
	printf "\t--path                       : changement du path par défaut : c:/dev/sdwstudies\n"
	printf "\t--name                       : changement du name par défaut : web\n"
}

function launchDocker(){
	docker stop $name 2>/dev/null
	docker rm $name 2>/dev/null
	docker run -p $port:80 --name $name -v $path/algoavancee/game/:/var/www/html/ -d php:7.0.12-apache
}

while :; do
    case $1 in
        -h|-\?|--help)
            usage
            exit
            ;;
        --port|-p)
            port=$2
            ;;
        --path|-v)
            path=$2
            ;;
        --name|-n)
			name=$2
			;;
        *)
            break
    esac
    shift
    shift
done

launchDocker