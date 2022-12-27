#cut -d : -f 2 amr

function selectype (){
select stint in Show-all-table Select-Multiple-Columns Select-Where 
do
case $stint in 
Show-all-table  ) 
showTable
break
;;
Select-Multiple-Columns ) 
 col_num 
break
;;
Select-Where )  

source ../.././selectwhere.sh
break
;;

* ) echo "please enter a valid datatype"  

;;
esac
done
}

function showTable(){
    read -r -p "Please enter Table name " table_name

     while [ ! -e $table_name ]
        do
            echo "table doesnt exist , try again or exit"
            read -r table_name
            if [ $table_name == 'exit' ]
                then break
            fi
        done
                        echo "---------------------------------------------"

        cat $table_name
                        echo "---------------------------------------------"

}


function col_num(){
    read -r -p "Please enter Table name " table_name

     while [ ! -e $table_name ]
        do
            echo "table doesnt exist , try again or exit"
            read -r table_name
            if [ $table_name == 'exit' ]
                then break
            fi
        done

      read -r -p "please enter number of columns you want to select from " col_num

      declare -i number=$(head -n1 "./$table_name.md" | awk -F : '{print NF-1 ;}')

        col_name=$(head -n1 $table_name | sed  $'s/:/ /g' | awk  -F " " '{ print $0 }')
        echo "$col_name"
    while [ $col_num -le $number ]
    do
       
        echo "Please enter columns you want to select from the above : "
        read -r -a arr 
        #take columns from user and put in an array
        
                        addarr=()
                   #get each column field number     
            for elem in ${arr[@]}
            do 
              myarr=$(head -n1 $table_name | awk -F : -v value=$elem '{
                for (i=1; i<NF; i++){
                    if($i == value){
                         print(i)
                        
                    }
                }

                }')
                #add fields numbers to new array
                addarr+=("$myarr")
            #echo $elem
            done
           

                echo "---------------------------------------------"
            for i in ${addarr[@]} ; do echo  `cut -d : -f$i $table_name` ; done



        break
    done

    while [ ! $col_num -le $number ] 
    do 
    echo "Columns range doesn't exist"
    break
    done


    
   

}

selectype

# col_num name
# function col_num(){
# awk -F : -v value=$1 '{
#  for (i=1; i<NF; i++){
#     if($i == value){
#         print(i)
#     }
#  }

# }' amr
# }

#generic function for select where


#testing select
 

 #  len=${#addarr[@]}
          
            # for value in "${addarr[@]}"
            #                 do
            #                   for ((i=1;i<len;i++));
            #                      do
            #                      echo -n $value 
            #                      while [ $i -lt $len ]
            #                      do
            #                      echo -n ","
            #                      done
            #                 done 

            #                                            done


                       # cut -d : -f$(for i in "${addarr[@]}";do echo "$i";done) amr 
