make -B&&
touch ./U_SoPaNaoChatearComErrosDoRM.txt
rm U_*;

echo "Results folder name:"
read Folder
Version="-06"
[ -d "$Folder" ] && rm -r "$Folder"
mkdir "$Folder"
cp antsibm"$Version"  "$Folder"
cp AntsIBM"$Version".cpp  "$Folder"/CPPAntsIBMUsado.cpp
cp plot-png.sh  "$Folder"
#cp plots-Mass.plt  "$Folder"
cd "$Folder"

./antsibm"$Version" &&
mkdir Plots
sh plot-png.sh &&
#gnuplot plots-Mass.plt
#cp ../LogsLast.txt .

[ ! -d ../LastResult ] && mkdir ../LastResult
touch ../LastResult/Paranaochatearcomerrosdorm.txt
rm -r ../LastResult/*
cp -r * ../LastResult/

echo "Done!"

#osascript -e 'tell app "System Events" to display dialog "Calculo terminado." with icon 1 with title "Calculo terminado." '
