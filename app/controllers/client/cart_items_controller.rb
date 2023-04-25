class Client::CartItemsController < Client::ApplicationController
  #before_action :set_cart

  def create
    @cart = current_user.cart || current_user.create_cart
    result = Client::AddProductToCart.call(cart: @cart, product_id: params[:product_id], quantity: params[:quantity])

    if result.success?
      flash[:notice] = "Product added to cart"
      redirect_to client_products_path
    else
      flash[:error] = "Failed to add product to cart"
      redirect_to client_product_path(params[:product_id])
    end
  end

  def destroy
    @cart = current_user.cart || current_user.create_cart
    result = Client::RemoveProductFromCart.call(cart: @cart, cart_item_id: params[:id])

    if result.success?
      flash[:notice] = "Product removed from cart"
    else
      flash[:error] = "Failed to remove product from cart"
    end
    redirect_to client_cart_path
  end

  # private

  # def set_cart
  #   @cart = current_user.cart || current_user.create_cart
  # end
end

