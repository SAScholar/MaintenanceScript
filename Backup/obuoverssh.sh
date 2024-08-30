# Untested Unstable
# This script was written for OpenBSD 7.4 and least. Untest in the other operation systems.
# You should make your own judgement as to whether this script is safe and whether it will cause damage to your system. 
# The script is provided as is and I am not responsible for any problems arising from it.

echo "Server?"
read server
echo "User (need doas)?"
read user
echo "Starting backup, maybe you will be required enter your passwd later."

$name=date +%Y%m%d
mkdir $name
cd $name

ssh $user@$server "doas dump -0 -a -u -h 0 -f - /home" > home.dmp
ssh $user@$server "doas dump -0 -a -u -h 0 -f - /" > root.dmp
ssh $user@$server "doas dump -0 -a -u -h 0 -f - /var" > var.dmp
ssh $user@$server "doas dump -0 -a -u -h 0 -f - /usr" > usr.dmp
ssh $user@$server "doas dump -0 -a -u -h 0 -f - /home" > home.dmp

echo "Backup process completed."