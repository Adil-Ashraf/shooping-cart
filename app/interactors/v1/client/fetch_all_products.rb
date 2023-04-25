module Client
  class FetchAllProducts
    include Interactor

    def call
      context.products = Product.all
    end
  end
end

