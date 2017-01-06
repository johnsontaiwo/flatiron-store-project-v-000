class CartsController < ApplicationController
 #before_action :set_cart, only: [:show, :checkout]


  def show
    @current_cart =  current_user.current_cart
    #binding.pry
  end
  

  def checkout
  
   @current_cart = current_user.current_cart
   
   @current_cart.line_items.each do |line_item|
    item = Item.find(line_item.item_id)
    item.inventory = (item.inventory - line_item.quantity)
    item.save
    #binding.pry
   end

   current_user.remove_cart
     
   
   redirect_to cart_path(@current_cart)
   
  end

  private
   
   def set_cart
    @current_cart = Cart.find(params[:id])
   end
end
