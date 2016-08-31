require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  10.times do 
    options = {brand: Faker::Commerce.product_name,
               name: Faker::Company.name,
               price: Faker::Commerce.price
               }
    Product.create(options)
  end
end
