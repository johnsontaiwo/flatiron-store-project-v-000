class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.where("inventory > ?", 0)
    #@user = current_user
    #@cart = current_user.current_cart_id  
      
 end
end
