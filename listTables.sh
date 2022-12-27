clear

echo "List all Databases" 
echo "-------------------------------------------------------------------------"

var=`ls | grep -v md$`
counter=1
for i in $var
do 

echo "$counter) $i"
echo "-------------------------------------------------------------------------"

counter=$[$counter +1]
done