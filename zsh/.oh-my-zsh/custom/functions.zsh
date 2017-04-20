cl()
{
  builtin cd $1
  ls -hla
}

c()
{
  builtin cd $1
  ls -hla
}

mc()
{
  mkdir $1
  cd $1
  ls -hla
}

tophistory()
{
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
