#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PRINT_RESULT() {
	echo "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
}
if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]
then
	RESULT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$1")
	if [[ -z $RESULT ]]
	then
		echo "I could not find that element in the database."
	else
		echo $RESULT | while IFS='|' read A B C D E F G 
		do
			PRINT_RESULT $A $B $C $D $E $F $G
		done 
	fi
elif [[ $1 =~ ^[A-Z]([a-zA-Z]|)$ ]]
then
	RESULT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol='$1'")
	if [[ -z $RESULT ]]
	then
		echo "I could not find that element in the database."
	else
		echo $RESULT | while IFS='|' read A B C D E F G 
		do
						PRINT_RESULT $A $B $C $D $E $F $G
		done 
	fi
elif [[ $1 =~ ^[A-Z][a-z]+$ ]]
then
	RESULT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where name='$1'")
	if [[ -z $RESULT ]]
	then
		echo "I could not find that element in the database."
	else
		echo $RESULT | while IFS='|' read A B C D E F G 
		do
						PRINT_RESULT $A $B $C $D $E $F $G
		done 
	fi
else
	echo "I could not find that element in the database."
fi