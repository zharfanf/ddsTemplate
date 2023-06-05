sudo apt-get update
sudo apt install -y iperf3
sudo apt install -y ffmpeg
cd ~
git clone https://github.com/royyhuang/VAP-Concierge.git
cd VAP-Concierge/

git checkout vap-zharfanf

# copying data-set to app
cp -r ../dds-zharfanf/data-set/ ./src/app/dds-adaptive/

# copying results and profile

# rene
cd src/app/dds-adaptive/data-set/rene
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*rene*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-rene/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../uav-1/
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*uav-1*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-uav-1/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../uav-2/
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*uav-2*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-uav-2/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

# add new dataset to the app

cd ../jakarta/
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*jakarta*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-jakarta/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../highway/
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*highway*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-highway/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../coldwater/
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*coldwater*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-coldwater/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../roppongi/
mkdir results
for i in ../../../../../../dds-zharfanf/workspace/results/*roppongi*; do cp $i ./results/; done
cp -r ../../../../../../dds-zharfanf/workspace/profile-roppongi/profile-separated/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ../..

cd ..
wget people.cs.uchicago.edu/~kuntai/frozen_inference_graph.pb
cd workspace/
cp ../frozen_inference_graph.pb .