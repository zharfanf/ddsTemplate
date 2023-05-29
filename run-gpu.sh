sudo apt-get update
sudo apt install -y iperf3
sudo apt install -y ffmpeg
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq
git clone https://github.com/zharfanf/dds-zharfanf.git

# Assume there is no miniconda3 available
if [[ -f  "./miniconda3" ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh
    bash Miniconda3-py310_23.3.1-0-Linux-x86_64.sh
fi

cd dds-zharfanf/

git checkout edge

conda env create -f conda_environment_configuration.yml

conda activate dds

pip install gdown

# download and unzip data-set 

gdown --id 1JD0_Wr0Jxc0ra6glfsp5RYGHjEwyzryE

tar -xzf Copy\ of\ data-set.tar.gz
rm Copy\ of\ data-set.tar.gz

# add new dataset
gdown --id 1D0xF0A33PKQHNk-kAJqCyuZIZg5TfaBK # new-dataset.zip
unzip new-dataset.zip
cp -r ./new-dataset/* ./data-set/


# is this still necessary? dds-zharfanf from my local earlier
cd ..
mkdir temp
cd temp
gdown --id 1pAwjs24a3tMui9xqo0EaRqYdq96BXBbn
unzip dds-zharfanf.zip
cp -r ./dds-zharfanf/workspace/results/ ../dds-zharfanf/workspace/
cp ./dds-zharfanf/workspace/stats ../dds-zharfanf/workspace/
cp ./dds-zharfanf/workspace/statsTest ../dds-zharfanf/workspace/
cp -r ./dds-zharfanf/workspace/profile-* ../dds-zharfanf/workspace/
cp -r ./profile-rene/profile-separated/ ../data-set/rene/
cp -r ./profile-uav-1/profile-separated/ ../data-set/uav-1/
cp -r ./profile-uav-2/profile-separated/ ../data-set/uav-2/
cd ../dds-zharfanf/workspace

# roppongi results
gdown --id 1g6vaIz8Q6hBnJZxDJJqVXTxTaR9AUw_R
unzip roppongi.zip
for i in roppongiResults/*; do cp $i ./results/; done
cp -r ./profile-roppongi/profile-separated/ ../data-set/roppongi/

# coldwater results
gdown --id 1ZqXFyWYCFOZvbF6448c3pBfSfKrEobD-
unzip coldwater.zip
for i in coldwaterResults/*; do cp $i ./results/; done
cp -r ./profile-coldwater/profile-separated/ ../data-set/coldwater/

# jakarta, highway, and coldwater as well as roppongi mpeg results
gdown --id 1aS_MKrMUcUxFXm7BVsGw8vdfi3WJdziA
unzip jakarta_highway_update_of_coldwater_roppongi.zip
for i in ./workspace/jakartaResults/*; do cp $i ./results/; done
for i in ./workspace/highwayResults/*; do cp $i ./results/; done
for i in coldwaterMpegGt/*; do cp $i ./results/; done
for i in roppongiMpegGt/*; do cp $i ./results/; done
cp -r ./workspace/profile-jakarta/profile-separated/ ../data-set/jakarta/
cp -r ./workspace/profile-highway/profile-separated/ ../data-set/highway/
rm -r ./workspace/

wget people.cs.uchicago.edu/~kuntai/frozen_inference_graph.pb
cp ./frozen_inference_graph.pb ..

# adding new datas-set (jakarta and highway)
cd ../data-set/
gdown --id 1SDYoI_fj9OqWH8yyH_K3Nms2-pSfIsdX
unzip new-dataset-2.zip
rm new-dataset-2.zip

cd ./jakarta/
mkdir src
mv * src/

cd ../highway/
mkdir src
mv * src/

cd ../uav-1/
mkdir src
mv * src/

cd ../rene
mkdir src
mv * src/

cd ../uav-2
mkdir src
mv * src/

conda install jupyter
pip install pandas
pip install matplotlib
pip install grpcio grpcio-tools

# # server-2
# gdown --id 1fgYU85uzT6JsUz4sAVJ3wtvXVpYuygaM
# unzip server-2.zip

# # server-1
# gdown --id 14jKukgoaOoH3Ma1nT0-UnJCNxMnN-UbN
# unzip server-1.zip
