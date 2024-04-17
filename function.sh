find_avg$($1 $2 $3){ 
  len=$#
  sum=0
  for x in "$@"
  do
     sum=$((sum + x))
  done
  avg=$((sum/len))
  return $avg
}
read -p "enter values " $1 $2 $3
find_avg $1 $2 $3
printf "%f" "$?"
printf "\n"
