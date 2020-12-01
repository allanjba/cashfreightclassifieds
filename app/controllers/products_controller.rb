class ProductsController < ApplicationController

  before_action :set_product, only: %i[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: %i[:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    set_product
    @latest = Product.last(3)
    @product.increase_visit
  end

  def new
    @product = Product.new
  end

  def edit
    set_product
  end

  def create
    @product = current_user.products.new(product_params)
    
    if @product.save
      redirect_to @product, notice: 'The product was successfuly created.'
    else
      render :new
    end

  end

  def update
    set_product
    if @product.update(product_params)
      redirect_to @product, notice: 'The product was successfuly updated.'
    else
      render :edit
    end
  end

  def destroy
    set_product
    @product.destroy
    redirect_to products_url, notice: 'Product listing was deleted.'
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: products_path)
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end


    def product_params
      params.require(:product).permit(:title, :price, :location, :condition, :description, images: [])
    end

    

end
