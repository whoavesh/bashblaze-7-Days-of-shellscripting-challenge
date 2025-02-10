#!/bin/bash

read -p "Enter number 1: " n1

read -p "Enter number 2: " n2

<<info
$((n1+n2)) this represent arithmetic expansion $(()).
It allows us to perform arithmetic operation on variables,
if we just do $n1+$n2 then it will perform string concatenation (appends two strings)
info

echo "The sum of two numbers is : $((n1+n2))"
