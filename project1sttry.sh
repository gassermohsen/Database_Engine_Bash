

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










function databaseconnectionselection(){

    options=("Create-Table" "List-all-Tables" "Drop-Table" "Insert-Into-Table" "Select-from-table" "Exit")

select opt in "${options[@]}"
do 
case $opt in
"Create-Table") 
createdatabase

;;
"List-all-Tables")

clear

echo "List all Databases" 
echo "-------------------------------------------------------------------------"

var=` ls -d */`
counter=1
for i in $var
do 

echo "$counter) $i"
echo "-------------------------------------------------------------------------"

counter=$[$counter +1]
done




 selection
;;
"Drop-Tables")
echo "Drop Database" 
break ;
;;
"Insert-Into-Table")
echo "Connect Database" 
break ;
;;
"Select-from-table")
echo "Select-from-table"
break ;
;;
"Exit")
echo "Exit"
break ;
;;
esac
done
   
}









function connectdb(){

    if [[ -e $dir ]] ; then
clear
echo "-----------------------------------------------------"
echo "Connected to $dbname database"
echo "-----------------------------------------------------"

databaseconnectionselection

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
echo "-------------------------------------------------------------------------"

counter=$[$counter +1]
done
 selection
;;
"Drop-Database")
echo "Drop Database" 
break ;
;;
"Connect-Database")
    read -p "Please enter database name to connect" dbname

connectdb
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