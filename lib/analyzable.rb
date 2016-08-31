require_relative '../lib/product'
require_relative '../lib/analyzable'
module Analyzable
  # Your code goes here!
  def count_by_brand(products)
  	brands = {}
    products.each do |product|
      if brands.keys.include?(product.brand)
        brands[product.brand] += 1
      else
        brands[product.brand] = 1
      end
    end
    return brands
  end

  def count_by_name(products)
  	names = {}
    products.each do |product|
      if names.keys.include?(product.name)
        names[product.name] += 1
      else
        names[product.name] = 1
      end
    end
    return names
  end

 def average_price(products)
  	total_price = 0
  	products.each do |product|
  		total_price += product.price.to_f
  	end
  	return avg_price = (total_price / products.length).round(2)
  end

  def print_report
  	puts "Inventory by Brand:"
  	count_by_brand(products).each do |key, value|
  		puts " - #{key}: #{value}"
  	end
  	puts "Inventory by Name:"
  	count_by_name(products).each do |key, value|
  		puts " - #{key}: #{value}"
  	end
  end


end
