#search value given by user in a column given by the user also
#for loop on the selected column to get the NR which is equal to the row number of the searched value
function select_where(){
    awk -F ':' -v value=$1 -v col_num=$3 '{                    
        if($col_num == value && NR!=1)
            print($0)

    } ' $2
}
#to print the rows
declare -a var
var=$(select_where 015 db 3)
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