#!/bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"

welcome_text="Welcome to My Salon, how can I help you?"
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c "

declare -A service_list
declare -a service_id_list

while IFS='|' read -r service_id name; do
  service_list[$service_id]="$name"
  service_id_list+=("$service_id")
done < <($PSQL "select service_id, name from services order by service_id")

declare -A customer_list
while IFS='|' read -r phone name; do
  customer_list[$phone]="$name"
done < <($PSQL "select phone, name from customers")

echo -e $welcome_text "\n"

choose_service() {
  if [[ -n $1 ]]; then
    echo -e "\nI could not find that service. What would you like today?"
  fi
  for id in "${service_id_list[@]}"; do
    echo "$id) ${service_list[$id]}"
  done
}

choose_service
read SERVICE_ID_SELECTED

while [[ -z $SERVICE_ID_SELECTED ]] || [[ ! -v service_list[$SERVICE_ID_SELECTED] ]]; do
  choose_service again
  read SERVICE_ID_SELECTED
done

echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

if [[ ! -v customer_list["$CUSTOMER_PHONE"] ]]
then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  c=$($PSQL "insert into customers (phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
else
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
fi

echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME

service_name=${service_list[$SERVICE_ID_SELECTED]}
customer_id=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
d=$($PSQL "insert into appointments (customer_id, service_id, time) values 
('$customer_id', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
echo -e "\nI have put you down for a $service_name at $SERVICE_TIME, $CUSTOMER_NAME."