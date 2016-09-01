require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!


  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"
  create_finder_methods :brand, :name
  
  def self.create(opts={})
    item = self.new(opts)
    CSV.open(@@data_path, "a+") do |csv|
      csv << [item.id, item.brand, item.name, item.price]
    end
    return item
  end 

  def self.all
  	all_csv_data = []
  	CSV.foreach(@@data_path, headers: true) do |row|
      all_csv_data <<  self.new( id: row["id"], brand: row["brand"], name: row["product"], price: row["price"] )
    end
    return all_csv_data
  end

  def self.first(n=1)
  	all_data = self.all
  	if n == 1
      return all_data.first(1)[0]
    else 
      return all_data.first(n)	
   end
  end

  def self.last(n=1)
  	all_data = self.all
  	if n == 1
      return all_data.last(1)[0]
    else 
      return all_data.last(n)	
   end
  end

 def self.find(id)
   all_data = self.all
   return_id = all_data.find { |p| p.id == id }
    if return_id
      return return_id
    else
      raise ProductNotFoundError
    end
  end
  
  def self.destroy(id)
    to_delete = find(id)
    table = CSV.table(@@data_path)
    table.delete_if do |row|
      row[:id] == id
    end
    File.open(@@data_path, 'w') do |f|
      f.write(table.to_csv)
    end
    return to_delete
  end

  def self.where(opts={})
    all_data = self.all
    wanted_data = []
    all_data.each do |product|
      opts.each do |key, value|
        if product.send(key) == value
          wanted_data << product
        end
      end
    end
    return wanted_data
  end

  def update(opts={})
    Product.destroy(self.id)
    updated_or_original_brand = opts[:brand]? opts[:brand] : brand
    updated_or_original_name = opts[:name]? opts[:name] : name
    updated_or_original_price = opts[:price]? opts[:price] : price
    updated_product = Product.create ({id: self.id, brand: updated_or_original_brand, name: updated_or_original_name, price: updated_or_original_price})
    return updated_product
  end

end
