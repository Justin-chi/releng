#!/bin/bash
#set -o errexit
#set -o nounset
#set -o pipefail 
set -x

COMPASS_DIR=`cd ${BASH_SOURCE[0]%/*}/;pwd`
export COMPASS_DIR

for i in python-cheetah python-yaml screen; do
    if [[ `dpkg-query -l $i` == 0 ]]; then
        continue
    fi
    #sudo apt-get install -y --force-yes  $i
done

screen -ls |grep deploy|awk -F. '{print $1}'|xargs kill -9
screen -wipe
#screen -dmSL deploy bash $COMPASS_DIR/ci/launch.sh $*

WORK_DIR=$COMPASS_DIR/work/


source ${COMPASS_DIR}/log.sh
source ${COMPASS_DIR}/util.sh


######################### main process
if true
then
if ! prepare_env;then
    echo "prepare_env failed"
    exit 1
fi

log_info "########## set up ci-env begin #############"
if ! deploy_ci_env;then
    log_error "deploy_ci_env failed"
    exit 1
fi
fi


#install git
ansible-playbook playbook.yml  -i ./hosts 

#create jenkins

#download jenkins slave

#config cron

#service jenkins start

#add ssh access right to internal repo

