class LineItemsController < ApplicationController

  def create
    #@user = current_user
    #@cart = @user.current_cart
    
    if !current_user.current_cart
        current_user.create_cart 
    
    #line_item = Line_item.new(lineitem_params)
    #item = Item.find(lineitem_params[:item_id])
    line_item = current_user.current_cart.add_item(params[:item_id])
     if line_item.save
       redirect_to cart_path(current_user.current_cart)
     else
       redirect_to store_path
     end
    end
  end

  private

  def lineitem_params
    params.require(:line_item).permit(:cart_id, :item_id, :quantity)
  end
end
