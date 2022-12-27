

#make database directory if not exist 
mkdir -p database 
cd database 





function selection(){

    options=("Create-Database" "List-all-Databases" "Drop-Database" "Connect-Database" "Exit")

select opt in "${options[@]}"
do 
case $opt in
"Create-Database") 
source .././createdatabase.sh
break;
;;
"List-all-Databases")
source .././listdatabases.sh
selection
break
 
;;
"Drop-Database")
source .././dropdatabase.sh
break

;;
"Connect-Database")
source .././connectdatabase.sh
selection
break
;;
Exit)
echo "Exit" 
cd ..
break;

;;
esac
done
   
}

selection



# function createdatabase(){

#     read -p "Please enter database name " dir

# if [[ ! -e $dir ]]; then
#     mkdir $dir
#     cd $dir 
#     echo "$dir Database created succesfully "
# else  
# echo "-----------------------------------------------------"

# echo "$dir database already exists"
# echo "-------------------------------------------------"
# clear
# selection
# fi    
# }