class Module
  def create_finder_methods(*attributes)
    # Your code goes here!
    # Hint: Remember attr_reader and class_eval
    attributes.each do |key|
      class_eval("def self.find_by_#{key}(value); all_data = self.all; all_data.each do |item|; if item.#{key} == value; return item; end; end; end;")
    end
  end
end
