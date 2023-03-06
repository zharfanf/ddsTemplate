sudo apt-get update
sudo apt install -y iperf3
sudo apt install -y ffmpeg
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq
git clone https://github.com/zharfanf/dds-zharfanf.git

cd dds-zharfanf/

yq -i '.dependencies[1] = tensorflow=1.14' conda_environment_configuration.yml

conda env create -f conda_environment_configuration.yml

pip install gdown

gdown --id 1JD0_Wr0Jxc0ra6glfsp5RYGHjEwyzryE

tar -xzf Copy\ of\ data-set.tar.gz

cd workspace/

mkdir results

cd results/

gdown --id 1amHsuouzNZ_HgmOwoel8kCBf9R4CUOZ7

unzip res20Feb.zip

mv ./res20Feb/* ./

rm -r res20Feb/

cd ..

wget people.cs.uchicago.edu/~kuntai/frozen_inference_graph.pb

cd ../data-set
cp -r uav-1/ uav-1-roy/
mv uav-1/ src/
mkdir uav-1/
mv src/ uav-1/.

cp -r rene/ rene-roy/
mv rene/ src/
mkdir rene/
mv src/ rene/.

cp -r thailand-1st-half/ thailand-1st-half-roy/
mv thailand-1st-half/ src/
mkdir thailand-1st-half/
mv src/ thailand-1st-half/.

cp -r uav-2/ uav-2-roy/
mv uav-2/ src/
mkdir uav-2/
mv src/ uav-2/.

cp -r ../profile-rene/profile-separated/ ./rene/src/
cp -r ../profile-uav-1/profile-separated/ ./uav-1/src/
cp -r ../profile-uav-2/profile-separated/ ./uav-2/src/
cp -r ../profile-thailand-1st-half/profile-separated/ ./thailand-1st-half/src/

cd ..

# server-2
gdown --id 1fgYU85uzT6JsUz4sAVJ3wtvXVpYuygaM
unzip server-2.zip

# server-1
gdown --id 14jKukgoaOoH3Ma1nT0-UnJCNxMnN-UbN
unzip server-1.zip

# client-1
gdown --id 1Yyb1oGjPz9pFLhe4mxBjHfiwze0WNqxM
unzip client1.zip

# client-2
gdown --id 1QFssDjQomcW3pWixCJWPiG5ZBI-PnFiO
unzip client2.zip