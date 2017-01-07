class CartsController < ApplicationController
 before_action :set_cart, only: [:show, :checkout]


  def show
    #@current_cart =  Cart.find(params[:id])
  end
  

  def checkout
   #@current_cart = Cart.find(params[:id])
   
   @current_cart.line_items.each do |line_item|
    item = Item.find(line_item.item_id)
    item.inventory = (item.inventory - line_item.quantity)
    item.save
    #binding.pry
   end
   #@current_cart.update(status: "submitted")
   current_user.remove_cart
   @current_cart.update(status: "submitted")
   
   redirect_to cart_path(@current_cart)
   #binding.pry
  end

  private
   
   def set_cart
    @current_cart = Cart.find(params[:id])
   end
end
