#
# basic django bootstrap (ver.2)
#

echo "Should be system updated? YES !!" 
sleep 3

sudo aptitude update
sudo aptitude -y upgrade
#
# #<python-pip> is not neccesary for django (ver.2)
#sudo aptitude install python-pip
#
echo
echo "System will bootstrap files for django2 under python3" 
sleep 3

#
# install python3-pip
#
sudo aptitude - y install python3-pip

#
# pip3 installation
#
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
sudo -H pip3 install django

#
# create devel directory? 
#
# your dev directory is ....
#echo "How should I name your devel directory?"
#read MY_DEV_DIR
#mkdir $MY_DEV_DIR
#cd dev
#
# create your project in virtual environment
virtualenv my-py-project01

#
# check the django version
#
# open python3
python3
#>>>import django
#>>>django.get_version()
#'2.x.y'
#CRTL+D
#
# import django module and check django's version
#
python3 -c "import django"
python3 -m django --version
