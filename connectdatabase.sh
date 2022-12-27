function databaseconnectionselection(){

    options=("Create-Table" "List-all-Tables" "Drop-Table" "Insert-Into-Table" "Select-from-table" "delete-from-table" "update-table" "Exit")

select opt in "${options[@]}"
do 
case $opt in
"Create-Table") 
source ../.././createtable.sh
databaseconnectionselection
break
;;
"List-all-Tables")
source ../.././listTables.sh
databaseconnectionselection
break
;;
"Drop-Table")
source ../.././droptable.sh
databaseconnectionselection
break ;
;;
"Insert-Into-Table")
source ../.././insertTable.sh
break
;;
"Select-from-table")
                echo "---------------------------------------------"
source ../.././select.sh
                echo "---------------------------------------------"
databaseconnectionselection
break ;
;;
"delete-from-table")
source ../.././delete.sh
break
;;
"update-table")
source ../.././update.sh
break
;;
"Exit")
echo "Exit"
break ;
;;
esac
done
   
}









function connectdb(){
        read -p "Please enter database name to connect : " dbname
    if [[ -e $dbname ]] ; then
clear
echo "-----------------------------------------------------"
echo "Connected to $dbname database"
echo "-----------------------------------------------------"
cd $dbname
databaseconnectionselection
else 
echo "database name doesn't exist "
fi

}

connectdb