class User < ActiveRecord::Base

  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         def remove_cart
          self.current_cart_id = nil
          save 
          end

          def create_cart
            new_cart = Cart.create
            self.current_cart_id = new_cart.id
            save
          end
end
