# echo -n 
# "$(awk -F : 
# '{ if ( $2 == "gasser" )
# {next}
# else {print}}' 
# # amr)" >am
# value=$(awk -v n=$n '{if(NR == 2) {next}{print}}' amr2)
#####function select_where() gets a coloumn number and searches for a  value in that coloumn and it ignores the first line and returns the record number
function select_where(){          
    awk -F ':' -v value=$1 -v col_num=$col_num2 '{                    
        if($col_num == value && NR!=1)
            print(NR)
    } ' $2
}
###function col_num() searches for the coloumn number in the first line and returns it
function col_num(){
awk -F : -v value=$2 '{
 for (i=1; i<NF; i++){
    if($i == value && NR==1){
        print(i)
    }
 }

}' $1
}
##function check_valid_col_name() checks if the coloumn name exists in the first line only

 function check_valid_col_name(){
                  awk -F : -v value=$2 '{
        for (i=1; i<NF; i++){
            if($i == value && NR==1){
                print(i)
            }
            
            }

}' $1
                    }
#delete_from_table() gets the records numbers and deletes them
function delete_from_table(){
        echo -e  $(awk -F : -v record_num=$1 '{
            if(NR == record_num){
                next
            }
            else{
                print;
            }

        }' $delete_table_name ) >$delete_table_name
        $(sed -i 's/ /\n/g' $delete_table_name)
        }



declare -i flag=0
read -r -p "please enter table name : " delete_table_name

while [ ! -e $delete_table_name ]
    do
    echo "table doesnt exist , try again or exit"
    read -r delete_table_name
    if [ $delete_table_name == 'exit' ]
        then flag=1
        break
    fi
    done
if [ ! $flag == 1  ]
    then
    read -r -p "please enter column name : " delete_column_name
    flag2=$(check_valid_col_name $delete_table_name $delete_column_name)
    while [ ! $flag2 ]
        do
        read -r -p "column doesn't exist please enter a valid column name : " delete_column_name
        flag2=$(check_valid_col_name $delete_table_name $delete_column_name)
        if [ $delete_column_name == 'exit' ]
        then 
        break
        fi
        done
if [ $flag2 ]
    then
        col_num2=$(col_num $delete_table_name $delete_column_name)
        read -r -p "Please enter value to delete : " value_delete
        declare -a var
var=$(select_where $value_delete $delete_table_name)
declare -i count=0
for i in ${var[@]}; 
    do
    delete_from_table $(($i-$count))
    count=count+1
    done
echo "$count rows affected"
fi
fi