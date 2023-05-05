nfs="fs-00c96a4c7d9330317.efs.us-east-1.amazonaws.com"
mkdir /moodle_data
chmod 777 -R /moodle_data
echo $nfs":/    /moodle_data    nfs4    rw  0 0" >> /etc/fstab
mount /moodle_data
mkdir /moodle_data/moodle_datadata
chmod 777 -R /moodle_data/moodle_datadata