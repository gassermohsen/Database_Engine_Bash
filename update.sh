# echo -n 
# "$(awk -F : 
# '{ if ( $2 == "gasser" )
# {next}
# else {print}}' 
# # amr)" >am
# value=$(awk -v n=$n '{if(NR == 2) {next}{print}}' amr2)
function validate_unique(){
awk -F':' -v value=$1 '{ 
 if(NR!=1){     
    if($1==value){ 
        print(1);
        }
}
} ' "$2"
}

function type_check(){
    while [ -e $update_table_name ]
    do
                read -r -p "Enter value to be updated : " update_value

        if (( $col_num2 == 1));
            then   
                var=$(validate_unique $update_value $update_table_name)
                while [ "$var" == 1 ]
                do
                    echo "pk is not unique"
                    read -r update_value
                var=$(validate_unique $update_value $update_table_name)
                done
            fi
            if [ "$col_type" = "int" ] && [[ $update_value =~ [0-99]+$ ]]
                then
                break
            elif [ "$col_type" = "str" ]
                then 
                break
            else
                echo "type is not matched, type = $col_type"
                continue 
            fi
        done
}


#####function select_where() gets a coloumn number and searches for a  value in that coloumn and it ignores the first line and returns the record number
function select_where(){          
    awk -F ':' -v value=$1 -v col_num=$col_num2 '{                    
        if($col_num == value && NR!=1)
            print(NR)
    } ' $2
}
###function col_num() searches for the column number in the first line and returns it
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
##update from table takes the field number for the value to be changed and changes it in the record_num
function update_from_table(){
        echo -e  $(awk -F : -v record_num=$1 -v field=$2 -v newValue=$3 '{
            if(NR == record_num){
                for(i=1;i<NF;i++){
                    if(i==field){
                        $i = newValue
                    }
                }
                  gsub(/ /,":",$0)
                  print;
            }
            else{
                print;
            }
        }' $update_table_name ) >$update_table_name 
        $(sed -i 's/ /\n/g' $update_table_name)
        }


declare -i flag=0
read -r -p "please enter table name : " update_table_name

while [ ! -e $update_table_name ]
    do
    echo "table doesnt exist , try again or exit"
    read  -r update_table_name
    if [ $update_table_name == 'exit' ]
        then flag=1
        break
    fi
    done
if [ ! $flag == 1 ]
    then
    read -r -p "please enter column name : " update_column_name
    flag2=$(check_valid_col_name $update_table_name $update_column_name)
    while [ ! $flag2 ]
        do
        read  -r -p "column doesn't exist please enter a valid column name : " update_column_name
        flag2=$(check_valid_col_name $update_table_name $update_column_name)
        if [ $update_column_name == 'exit' ]
        then 
        break
        fi
        done
if [ $flag2 ]
    then
        col_num2=$(col_num $update_table_name $update_column_name)
        read  -r -p "Please enter value you want to update : " field_update
        declare -a var2
var2=$(select_where $field_update $update_table_name)
col_type=$(head -n1 "$update_table_name.md" | sed  $'s/:/ /g' | awk -v i=$col_num2 -F " " '{ print $i }')
# update_value2="$(type_check)"
type_check
declare -i count=0
for i in ${var2[@]}; 
    do
    update_from_table $i $col_num2 $update_value
    count=count+1
    done
echo "$count rows affected"
fi
fi