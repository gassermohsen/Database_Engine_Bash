
# function insert_into_table()
# {
#     echo "please enter table name"
#     read -r table2
#     while [ ! -e $table2 ]
#         do
#             echo "table doesnt exist , try again or exit"
#             read -r table2
#             if [ $table2 == 'exit' ]
#                 then break
#             fi
#         done
#     while [ -e $table2 ]
#     do
#         echo "please enter the primary key"
#         read -r pk1
#         x=$(head -n1 "./$table2.md" | awk -F : '{print $1;}')
#         if [ "$x" = "int" ] && [[ $pk1 =~ [0-99]+$ ]]
#             then echo  "$pk1:" >> $table2
#             break
#         elif [ "$x" = "str" ]
#             then echo  "$pk1:" >> $table2
#             break
#         else
#             echo "type is not matched, type = $x"
#             continue 
#         fi
        
        
#     done


# }
#insert_into_table


function validate_unique(){
awk -F':' -v value=$1 '{ 
 if(NR!=1){     
    if($1==value){ 
        print(1);
        }
}
} ' "$2"
}




    echo "please enter table name"
    read -r table2
    while [ ! -e $table2 ]
        do
            echo "table doesnt exist , try again or exit"
            read -r table2
            if [ $table2 == 'exit' ]
                then break
            fi
        done
declare -i number=$(head -n1 "./$table2.md" | awk -F : '{print NF-1 ;}')
#echo $number

#cut -d: -f1 amr   select coloums
for i in $(seq 1 $number);
    do
        col_name=$(head -n1 $table2 | sed  $'s/:/ /g' | awk -v i=$i -F " " '{ print $i }')
        col_type=$(head -n1 $table2.md | sed  $'s/:/ /g' | awk -v i=$i -F " " '{ print $i }')
        # echo "$col_name"
        # echo "$col_type"


        while [ -e $table2 ]
        do
            echo "please enter the $col_name" 
            read -r x
            if (( $i==1 ));
            then   
                var=$(validate_unique $x $table2)
                while [ "$var" = 1 ]
                do
                    echo "pk is not unique"
                    read -r x
                    var=$(validate_unique $x $table2) 
                done
            fi
            if [ "$col_type" = "int" ] && [[ $x =~ [0-99]+$ ]]
                then echo -n  "$x:" >> $table2
                break
            elif [ "$col_type" = "str" ]
                then echo -n  "$x:" >> $table2
                break
            else
                echo "type is not matched, type = $col_type"
                continue 
            fi
        done
        if (( $i==$number ));
        then   
            echo "" >> $table2
        fi
        
    done

















# function insert_into_table()
# {
#     echo "please enter table name"
#     read -r table2
#     while [ ! -e $table2 ]
#         do
#             echo "table doesnt exist , try again or exit"
#             read -r table2
#             if [ $table2 == 'exit' ]
#                 then break
#             fi
#         done
#     while [ -e $table2 ]
#     do

#     #    declare -i number=$(head -n1 "./$table2.md" | awk -F : '{printf "%d\n", NF-1 ;}')
#           declare -i number=$(cat $table2.md| wc -l)
#         echo "$number"
#         echo "$((number+10))"
#     for (( i=0; i<= $number; i++ ));
#         do    
#             echo "$i"
#         echo "please enter the primary key"
#         read -r pk1
#         x=$(head -n1 "./$table2.md" | awk -F : '{print $1;}')
#         if [ x=="int" ] && [[ $pk1 =~ [0-99]+$ ]]
#             then echo  "$pk1:" >> $table2
#             continue
#         elif [ x == "string" ]
#             then echo  "$pk1:" >> $table2
#             break
#         else
#             echo "type is not matched, type = $x"
#             continue 
#         fi
        
#       done 
#     done


# }
# insert_into_table
