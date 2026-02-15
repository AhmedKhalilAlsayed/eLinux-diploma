#! /bin/env bash

cToF(){
	 echo "scale=1"; $1 * 9/5 + 32" | bc;
 }
