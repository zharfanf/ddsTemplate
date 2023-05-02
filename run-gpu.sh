sudo apt-get update
sudo apt install -y iperf3
sudo apt install -y ffmpeg
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq
git clone https://github.com/zharfanf/dds-zharfanf.git

cd dds-zharfanf/

git checkout edge

conda env create -f conda_environment_configuration.yml

pip install gdown

gdown --id 1JD0_Wr0Jxc0ra6glfsp5RYGHjEwyzryE

tar -xzf Copy\ of\ data-set.tar.gz

# add new dataset
gdown --id 1D0xF0A33PKQHNk-kAJqCyuZIZg5TfaBK # new-dataset.zip
unzip new-dataset.zip
cp -r ./new-dataset/* ./data-set/

cd ..
mkdir temp
cd temp
gdown --id 1pAwjs24a3tMui9xqo0EaRqYdq96BXBbn
unzip dds-zharfanf.zip
cp -r ./dds-zharfanf/workspace/results/ ../dds-zharfanf/workspace/
cp ./dds-zharfanf/workspace/results/stats ../dds-zharfanf/workspace/
cp ./dds-zharfanf/workspace/results/statsTest ../dds-zharfanf/workspace/
cp -r ./dds-zharfanf/workspace/profile-* ../dds-zharfanf/workspace/

cd ../dds-zharfanf/workspace
# roppongi results
gdown --id 1g6vaIz8Q6hBnJZxDJJqVXTxTaR9AUw_R
unzip roppongi.zip
for i in roppongiResults/*; do cp $i ./results/; done

gdown --id 1ZqXFyWYCFOZvbF6448c3pBfSfKrEobD-
unzip coldwater.zip
for i in coldwaterResults/*; do cp $i ./results/; done

wget people.cs.uchicago.edu/~kuntai/frozen_inference_graph.pb

cd ../data-set/uav-1/
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
