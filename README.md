Setup:
  - rails db:create
  - rails db:migrate

Run
  - Run aplication: rails s 
  - Run test: rails rspec

Files to test:

- Case 1: 
  - header: name,birthdate,phone,address,credit_card_number,email
  - path: /csv_files/same_order_to_columns.csv


- Case 2:
    - header: birthdate,name ,last_name,cellphone,age,sex,card_number,email,approved,address
    - path: /csv_files/same_order_to_columns.csv

TODO:
  - Encrypt
  - Sidekiq