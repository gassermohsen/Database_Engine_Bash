read -r -p "Please enter table to drop " drop
  if [[ -e $drop && ! -z $drop ]] ; then
clear
echo "-----------------------------------------------------"
echo "$drop table deleted succefully"
echo "-----------------------------------------------------"
rm $drop
rm "$drop.md"
else 
echo "-------------------------------------------------------------------------"
echo "Can't delete table the name doesn't exist"
echo "-------------------------------------------------------------------------"
fi