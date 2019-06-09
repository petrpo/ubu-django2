#
# basic django bootstrap (ver.2) under ubuntu linux
#

echo "Should the system be updated? YES !!"
sleep 3

sudo aptitude update
sudo aptitude -y upgrade
#
# #<python-pip> loads django1 but we need django (ver.2)
#sudo aptitude install python-pip
#
echo
echo "System will bootstrap files for django2 under python3"
echo

#
# install python3-pip
#
sudo aptitude -y install python3-pip

#
# pip3 installation
#
echo
echo "pip3 upgrade, download virtualenv, django"
echo
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
sudo -H pip3 install django

#
# create devel directory? 
#
echo
echo "Should I create your dev directory? (y,yes,Y,Yes,YES|No or hit enter)"
read YES_or_NO
if [ $YES_or_NO == "y" ] || [ $YES_or_NO == "Y" ] || [ $YES_or_NO == "yes" ] || [ $YES_or_NO == "Yes" ] || [ $YES_or_NO == "YES" ] ; then
  echo "y,Y,yes,Yes,YES"
  echo
  echo "How Should I name devel directory"
  read MY_DEV_DIR
  if [ -e ~/$MY_DEV_DIR ] ; then
    echo
    echo "Ups. Directory $MY_DEV_DIR already exists. It cannot be created."
    echo
  else
    echo
    echo Directory $MY_DEV_DIR was created.
    echo
    mkdir ~/$MY_DEV_DIR
  fi
  cd ~/$MY_DEV_DIR
  # create your project in virtual environment in devel directory
  echo "What is your python project name ??"
  read $PY_PROJECT
  virtualenv $PY_PROJECT
  echo
  echo "Your project $PY_PROJECT is created"
  #
  # import django module and check django's version
  #
  python3 -c "import django"
  echo
  echo "django version in python3:"
  python3 -m django --version
  echo
fi
