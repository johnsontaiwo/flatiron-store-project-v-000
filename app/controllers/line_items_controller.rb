class LineItemsController < ApplicationController

  def create
    if !current_user.current_cart
        current_user.create_cart 
     end
     line_item = current_user.current_cart.add_item(params[:item_id]).save
         
         redirect_to cart_path(current_user.current_cart)
    end

end
