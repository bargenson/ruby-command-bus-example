#!/bin/bash

curl -XPOST localhost:3000/bookings \
  -H 'Content-type: application/json' \
  -H 'Accept: application/json' \
  --data '
{
  "flight": "AF123",
  "date": "2020-01-30",
  "amount": "998",
  "customer": {
    "first_name": "Eric",
    "last_name": "Cartman",
    "email": "eric@southpark.me",
    "phone": "514 661 0966",
    "address": {
      "name": "Eric Cartman",
      "street": "28201 E. Bonanza St.",
      "city": "South Park",
      "country": "USA",
      "zip": "65787"
    }
  }
}
'
