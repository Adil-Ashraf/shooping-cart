class Client::ProductsController < Client::ApplicationController
  def index
    result = Client::FetchAllProducts.call

    if result.success?
      @products = result.products
    else
      flash[:error] = t(result.message)
      redirect_to root_path
    end
  end

  def show
    result = Client::FetchProductById.call(id: params[:id])

    if result.success?
      @product = result.product
    else
      flash[:error] = t(result.message)
      redirect_to client_products_path
    end
  end
end
