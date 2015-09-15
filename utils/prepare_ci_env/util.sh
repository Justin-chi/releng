function prepare_env() {
    export PYTHONPATH=/usr/lib/python2.7/dist-packages:/usr/local/lib/python2.7/dist-packages
    sudo apt-get update -y
    sudo apt-get install -y --force-yes mkisofs bc curl
    sudo apt-get install -y --force-yes git python-pip python-dev
    sudo apt-get install -y --force-yes libxslt-dev libxml2-dev libvirt-dev build-essential qemu-utils qemu-kvm libvirt-bin virtinst libmysqld-dev
    sudo pip install --upgrade pip
    sudo pip install --upgrade ansible
    sudo pip install --upgrade virtualenv
    sudo pip install --upgrade netaddr
    sudo pip install --upgrade oslo.config
    sudo service libvirt-bin restart

    ## prepare work dir
    #rm -rf $WORK_DIR/{installer,vm,network,iso,venv}
    #mkdir -p $WORK_DIR/installer
    #mkdir -p $WORK_DIR/vm
    #mkdir -p $WORK_DIR/network
    #mkdir -p $WORK_DIR/iso
    #mkdir -p $WORK_DIR/venv
    #mkdir -p $WORK_DIR/cache

    #download_iso

    #cp $WORK_DIR/cache/`basename $ISO_URL` $WORK_DIR/iso/centos.iso -f

    # copy compass
    #mkdir -p $WORK_DIR/mnt
    #sudo mount -o loop $WORK_DIR/iso/centos.iso $WORK_DIR/mnt
    #cp -rf $WORK_DIR/mnt/compass/compass-core $WORK_DIR/installer/
    #cp -rf $WORK_DIR/mnt/compass/compass-install $WORK_DIR/installer/
    #sudo umount $WORK_DIR/mnt
    #rm -rf $WORK_DIR/mnt

    chmod 755 $WORK_DIR -R
    virtualenv $WORK_DIR/venv
}

function deploy_ci_env() {
echo "function deploy_ci_env"
}
