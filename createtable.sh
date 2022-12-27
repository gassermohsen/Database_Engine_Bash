

  
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
   
    echo "please enter table name"
    read -r table_name

    while [[ ! $table_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ || -e $table_name  ]];
        do
         echo "table name exist or you enter a valid name or type exit "
         read -r table_name
           if [ $table_name == 'exit' ]
                then break
            fi
        done
  
    if [[ ! -e $table_name && ! $table_name == "exit" &&  $table_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]
    then  
    touch $table_name 
    touch "$table_name.md"

    echo "please enter the number of columns"
    read -r num
    while [[ ! $num =~ [0-99]+$  ]]
        do
        echo "please enter a valid number"
        read -r num
        echo "$num"
        done
    
    for i in $( seq 1 $num);
        do
            
            if (( $i==1 ));
                then 
                    echo "please enter the primary key name"
                    read -r pk
                    while [[ ! $pk =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$  ]];
                        do 
                            echo "please enter a valid column name"
                            read -r pk
                        done
                    echo "please enter type of key string/int"
                    selectype
                echo -n "$pk:" >> $table_name
            else   
                echo "please enter column name"
                read -r variable
                while [[ ! $variable =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
                do 
                    echo "please enter a valid column name"
                    read -r variable
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
        fi
}
create_table
