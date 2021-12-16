#!/bin/bash
dir="$(pwd)"
echo $dir
echo "" > $dir/dependencies
for file in $dir/*
do
  if [ -d $file ]; then
    echo $file
    cd $file
    if [ -e 'pom.xml' ]; then
      echo "\n\n===================$file=====================\n\n" >> $dir/dependencies
      mvn dependency:tree >> $dir/dependencies
    fi
    cd ..
  fi
done
