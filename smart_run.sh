#FROM https://github.com/confluentinc/cp-docker-images/issues/213
if [[ ${AWS_DEPLOYMENT} == true || ${AWS_DEPLOYMENT} == 'True' || ${AWS_DEPLOYMENT} == 'true' ]];
then
    export LOCAL_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
    export PUBLIC_IP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
else
    export LOCAL_IP=`hostname -i`
    export PUBLIC_IP=`hostname`
fi

if [[ ! ${KAKFA_ADVERTISED_LISTENERS:-} ]];
then
    export KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=LOCAL:PLAINTEXT,PUBLIC:PLAINTEXT,PLAINTEXT:PLAINTEXT
    export KAFKA_ADVERTISED_LISTENERS=LOCAL://${LOCAL_IP}:9092,PUBLIC://${PUBLIC_IP}:9093,PLAINTEXT://`hostname -i`:9094
fi

exec /etc/confluent/docker/run