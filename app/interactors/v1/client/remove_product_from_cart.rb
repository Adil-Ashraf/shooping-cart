module Client
  class RemoveProductFromCart
    include Interactor

    def call
      cart = context.cart
      cart_item = cart.cart_items.find_by(id: context.cart_item_id)

      if cart_item
        cart_item.destroy
      else
        context.fail!(message: "remove_product_from_cart.failure")
      end
    end
  end
end
