# echo -n 
# "$(awk -F : 
# '{ if ( $2 == "gasser" )
# {next}
# else {print}}' 
# # amr)" >am
# value=$(awk -v n=$n '{if(NR == 2) {next}{print}}' amr2)
function select_where(){
    awk -F ':' -v value=$1 -v col_num=$col_num2 '{                    
        if($col_num == value && NR!=1)
            print(NR)
    } ' $2
}
function col_num(){
awk -F : -v value=$2 '{
 for (i=1; i<NF; i++){
    if($i == value && NR==1){
        print(i)
    }
 }

}' $1
}

 function check_valid_col_name(){
                  awk -F : -v value=$2 '{
        for (i=1; i<NF; i++){
            if($i == value && NR==1){
                print(i)
            }
            
            }

}' $1
                    }
        
function delete_from_table(){
        echo -e  $(awk -F : -v col_num3=$1 '{
            if(NR == col_num3){
                next
            }
            else{
                print;
            }

        }' $delete_table_name ) >$delete_table_name
        $(sed -i 's/ /\n/g' $delete_table_name)
        }



declare -i flag=0
delete_table_name=$(zenity --forms   --title "Delete Table" --text "delete table" --add-entry "please enter table name") 
while [ ! -e $delete_table_name ]
    do
    delete_table_name=$(zenity --forms --text "delete table" --add-entry "table doesnt exist , try again or exit") 
    if [ "$?" == 1 ]
        then flag=1
        break
    fi
    done
if [ ! $flag == 1 ]
    then
    delete_column_name=$(zenity --forms --text "delete table" --add-entry "please enter column name") 
    flag2=$(check_valid_col_name $delete_table_name $delete_column_name)
    while [ ! $flag2 ]
        do
        delete_column_name=$(zenity --forms --text "delete table" --add-entry "column doesn't exist please enter a valid column name") 
        flag2=$(check_valid_col_name $delete_table_name $delete_column_name)
        if [ $delete_column_name == 'exit' ]
        then 
        break
        fi
        done
if [ $flag2 ]
    then
        col_num2=$(col_num $delete_table_name $delete_column_name)
        value_delete=$(zenity --forms --text "delete table" --add-entry "Please enter value to delete")
        declare -a var
var=$(select_where $value_delete $delete_table_name)
declare -i count=0
for i in ${var[@]}; 
    do
    delete_from_table $(($i-$count))
    count=count+1
    done
zenity --info \
       --title "Info Message" \
       --width 500 \
       --height 100 \
       --text "$count rows affected"
fi
fi










