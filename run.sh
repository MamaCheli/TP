#!/bin/bash

path=$1
cd $1
extension=$2
backup=$3
mkdir $backup

bypass() {
  folder=$(ls)
  for file in $folder
  do
    if [[ "$file" != $backup ]]
    then
      if [ -d $file ]
      then
        cd $file
        bypass
        cd ..
      fi
      if [[ $file == *.$extension ]]
      then
        cp $file $path/$backup/$file
      fi
    fi
  done
}

bypass
tar -cf $4 $backup
echo "done"
