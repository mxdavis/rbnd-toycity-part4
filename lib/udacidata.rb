require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!
  create_finder_methods :brand, :name

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
      all_csv_data << row
    end
    return all_csv_data
  end
end
