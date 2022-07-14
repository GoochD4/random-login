#!/bin/bash
cd $(dirname $0)
i="1"

while [ $i -lt 100 ]
do
  echo $i
  name=$(sort -R names.txt | head -n1)
  extra=$(sort -R extra.txt | head -n1)
  surname=$(sort -R surnames.txt | head -n1)
  arroba="@"
  domain=$(sort -R domains.txt | head -n1)
  password=$(sort -R passwords.txt | head -n1)
  email="$name$extra$surname$arroba$domain"
  #echo #email
  command='curl -d "&email='$email'&username='$name'&password='$password'" -X POST https://www.choogyddad.com/DVWA/vulnerabilities/brute/'
  echo $command
  $command
  i=$[$i+1]
done
