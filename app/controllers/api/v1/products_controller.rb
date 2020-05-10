class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.by_type(params[:id])
  end
end
