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
# cd profile/
# touch profile_info.yml
# echo 'segment_size: 5' >> 

cd ../uav-1/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*uav-1*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-uav-1/ .
mv profile-separated/ profile/

cd ../uav-2/
mkdir results
for i in ../../../../../dds-zharfanf/workspace/results/*uav-2*; do cp $i ./results/; done
cp -r ./../../../../dds-zharfanf/workspace/profile-uav-2/ .
mv profile-separated/ profile/