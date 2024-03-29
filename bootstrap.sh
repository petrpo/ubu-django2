#
# basic django bootstrap (ver.2) under ubuntu linux
#

echo
echo "System will maybe need your sudo password !!"
echo

sudo aptitude -q update -q
echo "System will be updated and upgraded !!"
sudo aptitude -y -q upgrade -q
#
# #<python-pip> loads django1 but we need django (ver.2)
#sudo aptitude install python-pip
#
echo
echo "System will bootstrap files for django2 under python3 (quitely)"
echo

#
# install python3-pip
#
sudo aptitude -y install python3-pip

#
# pip3 installation
#
echo "pip3 upgrade, download virtualenv, django"
echo
sudo -H pip3 install --upgrade pip
sudo -H pip3 install virtualenv
sudo -H pip3 install django
sudo -H pip3 install django-admin

#
# create devel directory? 
#
echo
echo "Should I create your dev directory? (y,yes,Y,Yes,YES|No or hit enter)"
read YESorNO
if [ $YESorNO == "y" ] || [ $YESorNO == "Y" ] || [ $YESorNO == "yes" ] || [ $YESorNO == "Yes" ] || [ $YESorNO == "YES" ] ; then
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
  # create your project in virtual environment in devel directory
  cd ~/$MY_DEV_DIR
  echo "What is your python project name ??"
  read PY_PROJECT
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
