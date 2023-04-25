module Client
  class AddProductToCart
    include Interactor

    def call
      cart = context.cart
      product_id = context.product_id

      cart_item = cart.cart_items.find_or_initialize_by(product_id: product_id)
      cart_item.quantity = cart_item.quantity.to_i + context.quantity.to_i
      cart_item.save!

      context.cart_item = cart_item
    end
  end
end
