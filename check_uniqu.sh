
function validate_unique(){

awk -F':' -v value=$1 '{ 
 if(NR!=1){     
    if($1==value){ 
        print(1);
        }
}
} ' db
}
var=$(validate_unique 4)
echo $var