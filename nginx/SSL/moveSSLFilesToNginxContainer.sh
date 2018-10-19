#!/bin/bash
CONTAINER=$1

echo "Copying files..."
echo docker cp default.conf.orig $CONTAINER:/etc/nginx/conf.d/default.conf
docker cp default.conf.orig $CONTAINER:/etc/nginx/conf.d/default.conf
echo docker cp ssl-params.conf $CONTAINER:/etc/nginx/conf.d/.
docker cp ssl-params.conf $CONTAINER:/etc/nginx/conf.d/.
echo docker cp dhparam.pem $CONTAINER:/etc/nginx/conf.d/.
docker cp dhparam.pem $CONTAINER:/etc/nginx/conf.d/.

echo docker cp nginx-selfsigned.key $CONTAINER:/etc/nginx/.
docker cp nginx-selfsigned.key $CONTAINER:/etc/nginx/.
echo docker cp nginx-selfsigned.crt $CONTAINER:/etc/nginx/.
docker cp nginx-selfsigned.crt $CONTAINER:/etc/nginx/.

echo ""
echo "******************************************************************"
echo "Testing nginx configurarion: " docker exec -ti $CONTAINER nginx -t
docker exec -ti $CONTAINER nginx -t
echo ""
echo "Reloading nginx configuration: " docker exec -ti $CONTAINER nginx -s reload"

echo "******************************************************************"
echo ""
echo "All tasks completed"
