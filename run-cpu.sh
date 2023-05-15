sudo apt-get update
sudo apt install -y iperf3
sudo apt install -y ffmpeg
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq
git clone https://github.com/zharfanf/dds-zharfanf.git

cd dds-zharfanf/

git checkout edge

yq -i '.dependencies[1] = tensorflow=1.14' conda_environment_configuration.yml

conda env create -f conda_environment_configuration.yml

conda activate dds

pip install gdown

# download and unzip data-set 
gdown --id 1JD0_Wr0Jxc0ra6glfsp5RYGHjEwyzryE

tar -xzf Copy\ of\ data-set.tar.gz
rm Copy\ of\ data-set.tar.gz

# add new dataset (roppongi and coldwater)
gdown --id 1D0xF0A33PKQHNk-kAJqCyuZIZg5TfaBK # new-dataset.zip
unzip new-dataset.zip
cp -r ./new-dataset/* ./data-set/
rm new-dataset.zip

# add new dataset (jakarta and highway)
cd ./data-set/
gdown --id 1SDYoI_fj9OqWH8yyH_K3Nms2-pSfIsdX
unzip new-dataset-2.zip
rm new-dataset-2.zip

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

cd ../dds-zharfanf/workspace/

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

cd ../data-set/

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

cd ../roppongi
mkdir src
mv * src/

cd ../coldwater
mkdir src
mv * src/


conda install jupyter
pip install pandas
pip install matplotlib
pip install grpcio grpcio-tools


# cd ../data-set
# cp -r uav-1/ uav-1-roy/
# mv uav-1/ src/
# mkdir uav-1/
# mv src/ uav-1/.

# cp -r rene/ rene-roy/
# mv rene/ src/
# mkdir rene/
# mv src/ rene/.

# cp -r thailand-1st-half/ thailand-1st-half-roy/
# mv thailand-1st-half/ src/
# mkdir thailand-1st-half/
# mv src/ thailand-1st-half/.

# cp -r uav-2/ uav-2-roy/
# mv uav-2/ src/
# mkdir uav-2/
# mv src/ uav-2/.

# cp -r ../profile-rene/profile-separated/ ./rene/src/
# cp -r ../profile-uav-1/profile-separated/ ./uav-1/src/
# cp -r ../profile-uav-2/profile-separated/ ./uav-2/src/
# cp -r ../profile-thailand-1st-half/profile-separated/ ./thailand-1st-half/src/

# cd ..

# # server-2
# gdown --id 1fgYU85uzT6JsUz4sAVJ3wtvXVpYuygaM
# unzip server-2.zip

# # server-1
# gdown --id 14jKukgoaOoH3Ma1nT0-UnJCNxMnN-UbN
# unzip server-1.zip

# # client-1
# gdown --id 1Yyb1oGjPz9pFLhe4mxBjHfiwze0WNqxM
# unzip client1.zip

# # client-2
# gdown --id 1QFssDjQomcW3pWixCJWPiG5ZBI-PnFiO
# unzip client2.zip