

#make database directory if not exist 
mkdir -p database 
cd database 


#function to create database 
function createdatabase(){

    read -p "Please enter database name " dir

if [[ ! -e $dir && $dir =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]; then
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


function selection(){

    options=("Create-Database" "List-all-Databases" "Drop-Database" "Connect-Database" "Exit")

select opt in "${options[@]}"
do 
case $opt in
"Create-Database") 
createdatabase

;;
"List-all-Databases")

clear

echo "List all Databases" 
echo "-------------------------------------------------------------------------"

var=` ls -d */`
counter=1
for i in $var
do 

echo "$counter) $i"

counter=$[$counter +1]
done


echo "-------------------------------------------------------------------------"


 selection
;;
"Drop-Database")
echo "Drop Database" 
break ;
;;
"Connect-Database")
echo "Connect Database" 
break ;
;;
Exit)
echo "Exit" 
break ;
;;
esac
done
   
}

selection



function createdatabase(){

    read -p "Please enter database name " dir

if [[ ! -e $dir ]]; then
    mkdir $dir
    cd $dir 
    echo "$dir Database created succesfully "
else  
echo "-----------------------------------------------------"

echo "$dir database already exists"
echo "-------------------------------------------------"
clear
selection
fi    
}