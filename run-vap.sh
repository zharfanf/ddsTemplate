cd ~
git clone https://github.com/royyhuang/VAP-Concierge.git
cd VAP-Concierge/
git checkout dds-zharfanf

# copying data-set to app
cp -r ../dds-zharfanf/data-set/ ./src/app/dds-qyx/

# copying results and profile

# rene
cd src/app/dds-qyx/data-set/rene
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*rene*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-rene/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml

cd ../uav-1/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*uav-1*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-uav-1/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../uav-2/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*uav-2*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-uav-2/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

# add new dataset to the app

cd ../jakarta/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*jakarta*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-jakarta/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml

cd ../highway/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*highway*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-highway/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../coldwater/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*coldwater*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-coldwater/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml
cd ..

cd ../roppongi/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*roppongi*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-roppongi/ .
mv profile-separated/ profile/
cd profile/
touch profile_info.yml
echo 'segment_size: 5' >> profile_info.yml

cd ..
wget people.cs.uchicago.edu/~kuntai/frozen_inference_graph.pb
cd workspace/
cp ../frozen_inference_graph.pb .