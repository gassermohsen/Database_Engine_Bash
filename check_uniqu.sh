
function validate_unique(){

awk -F':' -v value=$1 '{ 
 if(NR!=1){     
    if($1==value){ 
        print(1);
        }
}
} ' "$2"
}
var=$(validate_unique 1 db)
echo $var