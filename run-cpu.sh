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
cd uav-1/
rm -r merged-results/ results/
cd ..
mv uav-1/ src/
mkdir uav-1/
mv src/ uav-1/.
