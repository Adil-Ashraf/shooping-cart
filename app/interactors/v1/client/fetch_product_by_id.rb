module Client
  class FetchProductById
    include Interactor

    def call
      product = Product.find_by(id: context.id)

      if product
        context.product = product
      else
        context.fail!(message: "fetch_product_by_id.failure")
      end
    end
  end
end
