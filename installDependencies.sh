#!/bin/bash
# Install python3-dev libraries
sudo apt-get install -y python3-dev libatlas-base-dev

# Setup venv
python3 -m venv ../venv-AutoMouseWeight
source ../venv-AutoMouseWeight/bin/activate

# Install dependencies
pip install -r requirements.txt

mkdir tmp
cd tmp

# Install pulsedThread library
git clone https://github.com/jamieboyd/pulsedThread
cd pulsedThread
make
sudo make install
cd ..

# Install GPIO_Thread library
git clone https://github.com/jamieboyd/GPIO_Thread
cd GPIO_Thread
cp HX711_setup.py setup.py
pip install .
#sudo python3 HX711_setup.py install
cd ..

# Install RFIDTagReader
git clone https://github.com/jamieboyd/RFIDTagReader
cd RFIDTagReader
cp RFIDTagReader_setup.py setup.py
pip install .
#sudo python3 RFIDTagReader_setup.py install
cd ..
