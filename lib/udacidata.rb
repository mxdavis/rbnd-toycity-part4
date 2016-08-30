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

  def self.all
  	all_csv_data = []
  	CSV.foreach(@@data_path, headers: true) do |row|
      all_csv_data <<  row.to_hash
    end
    return all_csv_data
  end

  def self.first(n=1)
  	all_data = self.all
  	if n.nil?
      return all_data.first(1)
    else 
      return all_data.first(n)	
   end
  end

  def self.last(n=1)
  	all_data = self.all
  	if n.nil?
      return all_data.last(1)
    else 
      return all_data.last(n)	
   end
  end
end
