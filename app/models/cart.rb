class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items


  def total
   sum_of_cart = 0 
    self.line_items.each do |line_item|
  sum_of_cart += line_item.item.price * line_item.quantity
    end
  sum_of_cart
  end

  def add_item(item_id)
   line_item = self.line_items.find_by(:item_id => item_id)
     if line_item
     line_item.quantity += 1
      line_item
      #binding.pry
    else
      self.line_items.build(:item_id => item_id)
    end
 end
end 
