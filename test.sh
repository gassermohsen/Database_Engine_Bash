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

        }' $delete_table_name ) >$delete_table_name 
        $(sed -i 's/ /\n/g' $delete_table_name)
        }
delete_from_table 3 2 loay 