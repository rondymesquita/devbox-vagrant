#!/usr/bin/env bash

up(){
  vagrant up
}

provision(){
  echo $1
  echo $2
  vagrant provision --provision-with $1,_variables
}

$@
exit $?
