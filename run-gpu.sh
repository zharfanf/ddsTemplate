sudo apt-get update
sudo apt install -y iperf3
sudo apt instal -y ffmpeg
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq
git clone https://github.com/zharfanf/dds-zharfanf.git

cd dds-zharfanf/

conda env create -f conda_environment_configuration.yml

pip install gdown

gdown --id 1JD0_Wr0Jxc0ra6glfsp5RYGHjEwyzryE

tar -xzf Copy\ of\ data-set.tar.gz

cd workspace/

wget people.cs.uchicago.edu/~kuntai/frozen_inference_graph.pb

cd ../data-set
cp -r uav-1/ uav-1-roy/
cd uav-1/
rm -r merged-results/ results/
cd ..
mv uav-1/ src/
mkdir uav-1/
mv src/ uav-1/.
cd ..

# server-2
gdown --id 1fgYU85uzT6JsUz4sAVJ3wtvXVpYuygaM
unzip server-2.zip

# server-1
gdown --id 14jKukgoaOoH3Ma1nT0-UnJCNxMnN-UbN
unzip server-1.zip