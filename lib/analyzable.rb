require_relative '../lib/product'
require_relative '../lib/analyzable'
module Analyzable
  # Your code goes here!
  def count_by_brand(products)
  	brands_hash = {}
    products.each do |product|
      if brands_hash.keys.include?(product.brand)
        brands_hash[product.brand] += 1
      else
        brands_hash[product.brand] = 1
      end
    end
    brands_hash
  end

  def count_by_name(products)
  	names_hash = {}
    products.each do |product|
      if names_hash.keys.include?(product.name)
        names_hash[product.name] += 1
      else
        names_hash[product.name] = 1
      end
    end
    return names_hash
  end

 def average_price(products)
  	total_price = 0
  	products.each do |product|
  		total_price += product.price.to_f
  	end
  	return avg_price = (total_price / products.length).round(2)
  end

  def print_report(products)
    print_brand_data(products)
    print_names_data(products).to_s
  end

  def print_brand_data(products)
  	puts "Inventory by Brand:"
  	count_by_brand(products).each do |key, value|
  	  puts " - #{key}: #{value}"
  	end
  end

  def print_names_data(products)
    puts "Inventory by Name:"
  	count_by_name(products).each do |key, value|
  	  puts " - #{key}: #{value}"
  	end
  end

end
