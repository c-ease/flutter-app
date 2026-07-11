# Desired functionalities
- Biometric login
- User should be able to register bank accounts
```
bank_account
{
    "id" : uuid
    "name" : "",
    "type" : id,
    "balance" : "",
    "init_balance" : ""
}
```
- Predefined bank account types and associated icons:
  - salary - dollar
  - savings - piggy-bank
  - wallet - wallet
  - serious_saving - bank
```
account_type
{
    "id" : uuid,
    "type" : "",
    "icon" : "",
    "desc" : ""
}
```

- User should be able to log transactions
```
transaction
{
    "type" : "",
    "amount" : value,
    "title" : "",
    "category" : id,
    "bank" : id,
    "date" : "" 
}
```
- While logging transaction or via dedicated UI, user should be able to create transaction categories
```
category
{
    "id" : uuid,
    "title" : "",
    "icon" : "",
    "color" : ""
    "type" : ""
}
```
- Predefined transaction categories and associated icons:
  - income
    - salary - dollar
    - gift - present
  - expense
    - food - food
    - rent - home
    - fuel - fuel
    - entertainment - movies