 echo "please enter table name"
    read table_name

  
function selectype (){
select stint in int str
do
case $stint in 
int )  
echo -n "$stint:" >> "$table_name.md"
break
;;
str ) 
 echo -n "$stint:" >> "$table_name.md"
break
;;

* ) echo "please enter a valid datatype"  

;;
esac
done
}
function create_table()
{   
   
    while [[ ! $table_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
        do
         echo "please enter a valid name choose 5 to Exit"
         read table_name
        done
    while [ -e $table_name ];
        do
            echo "This table is already exist,please enter another name"
            read table_name
        done
    touch $table_name 
    touch "$table_name.md"

    echo "please enter the number of columns"
    read num
    while [[ ! $num =~ [0-99]+$  ]]
        do
        echo "please enter a valid number"
        read num
        echo "$num"
        done
    
    for i in $( seq 1 $num);
        do
            
            if (( $i==1 ));
                then 
                    echo "please enter the primary key name"
                    read pk
                    while [[ ! $pk =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
                        do 
                            echo "please enter a valid column name"
                            read pk
                        done
                    echo "please enter type of key string/int"
                    selectype
                echo -n "$pk:" >> $table_name
            else   
                echo "please enter column name"
                read variable
                while [[ ! $variable =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
                do 
                    echo "please enter a valid column name"
                    read variable
                done
               
                echo "please enter type of column string/int"
                    selectype
                
                echo -n "$variable:" >> $table_name
                
            fi
            if (( $i==$num ));
            then   
                echo "" >> $table_name
            fi
        done
}
create_table
