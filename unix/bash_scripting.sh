#create and use a variable
MYFOLDER='folder_name'
ls $MYFOLDER #lists all files in folder_name
echo ls $MYFOLDER #see the resulting command

#variable contains a list of files (seperated by space)
# can be used as input to commands that take a 1 to n file names
files=`ls`
echo $files

#--- loop through an array ---#
declare -a arr=("50N_010E" "50N_010E" "60N_000E" "60N_010E")

## now loop through the above array
for i in "${arr[@]}"
do
   tar -xzvf Hansen_GFC2013_datamask_"$i".tif.zip --strip-components=6 Stornext/scienceweb1/development/gtc/downloads/WaterMask2010_UMD/Hansen_GFC2013_datamask_"$i".tif
done

tifs=`ls *.tif` #save the list of files to the tifs variable

#--- bash arrays and loops ----#
The weird, wondrous world of Bash arrays. https://medium.com/@robaboukhalil/the-weird-wondrous-world-of-bash-arrays-a86e5adf2c69
