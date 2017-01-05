class CartsController < ApplicationController

  

  def show
    @current_cart = current_user.current_cart
  end
  

  def checkout
  
   @current_cart = current_user.current_cart
   
   current_user.current_cart.line_items.each do |line_item|
    item = Item.find(line_item.item_id)
    item.inventory = (item.inventory - line_item.quantity)
    item.save
    
   end

   current_user.remove_cart
     
   
   redirect_to cart_path(current_user)
   
  end
end
