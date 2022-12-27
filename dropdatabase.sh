read -r -p "Please enter database to delete " drop
  if [[ -e $drop && ! -z $drop  ]] ; then
clear
echo "-----------------------------------------------------"
echo "$drop database deleted succefully"
echo "-----------------------------------------------------"
rm -r $drop
selection
else 
echo "-------------------------------------------------------------------------"
echo "Can't delete database the name doesn't exist"
echo "-------------------------------------------------------------------------"
selection
fi