#search value given by user in a column given by the user also
#for loop on the selected column to get the NR which is equal to the row number of the searched value

function col_num(){
awk -F : -v value=$2 '{
 for (i=1; i<NF; i++){
    if($i == value && NR==1){
        print(i)
    }
 }
}' $1
}


read -r -p "Please enter Table name " table_name

     while [ ! -e $table_name ]
        do
            echo "table doesnt exist , try again or exit"
            read -r table_name
            if [ $table_name == 'exit' ]
                then break
            fi
        done
        echo "Please enter column you want to select from : "
        read -r column
        colNum=$(col_num $table_name $column)   
        echo "Please enter value you want to select: "
        read -r select_value

function select_where(){
    awk -F ':' -v value=$1 -v col_num=$3 '{                    
        if($col_num == value && NR!=1)
            print($0)
    } ' $2
}
#to print the rows
declare -a var
var=$(select_where $select_value $table_name $colNum)
for i in "${var[@]}"; do echo "$i"; done



# function select_where(){
#     awk -F ':' -v value=$1 '{                    
#         if($1 == value && NR!=1)
#             print(NR);
            
#     } ' $2
# }
# declare -a var
# var=$(select_where gasser db2)
# for i in "${var[@]}"; do echo "$i"; done














# select_where 
# function select_where(){
#     end=$(awk '{print NR}' db2| tail -1)
#     awk -F ':' -v value=$1 -v rows=$end '{                     #value is the where clause value to be searched for
#         for(i=2; i<=rows; i++)
#             print(i)
#             #if($i=="ziad")
#                 #print(NR);

#     } ' db2
# }
# select_where 