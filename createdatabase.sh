#function to create database 
function createdatabase(){

    read -r -p "Please enter database name " dir

if [[ ! -e $dir && $dir =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ && ! -z $dir ]]; then
    mkdir $dir
    clear
    echo "-----------------------------------------------------"
    echo "$dir Database created succesfully "
    echo "-----------------------------------------------------"
    selection

elif [[ -e $dir ]] ; then
clear
echo "-----------------------WARNING!!!-----------------"
echo "-----------------------------------------------------"
echo "$dir database already exists"
echo "-----------------------------------------------------"
selection
else 
clear
echo "-------------------------------------------------------------------------"
echo "Can't create database the name contains special charachters or spaces on it"
echo "-------------------------------------------------------------------------"
selection
fi    
}

createdatabase