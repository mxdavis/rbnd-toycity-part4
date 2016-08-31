require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!


  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(opts={})
    item = self.new(opts)
    CSV.open(@@data_path, "a+") do |csv|
      csv << [item.id, item.brand, item.name, item.price]
    end
    return item
  end 

  # def self.create(opts={})
  #   item = self.new(opts)
  #   CSV.open(@@data_path, "a+") do |csv|
  #     csv << item[brand: item[:brand], name: item[:name], price: item[:price]]
  #   end
  #   return item
  # end

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
  
  def self.destroy(opts={})
    to_delete = self.find(id)
    table = CSV.table(@@data_path)
    table.delete_if do |row|
      row[:id] == opts[:id]
    end
    CSV.open(@@data_path, "wb") do |csv|
      csv << ["id", "brand", "product", "price"]
      table.each do |row|
        csv << row
      end
    end
    return to_delete
  end

  
end
