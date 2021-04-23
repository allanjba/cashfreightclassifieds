class ProductsController < ApplicationController

  before_action :set_product, only: %i[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: %i[:edit, :update, :destroy]

  def index
    if params[:query].present?
      @products = Product.search(params[:query])
      @results = params[:query]
    else
      @products = Product.all
    end
  end

  def show
    set_product
    @latest = Product.last(3)
    @product.increase_visit
    @favorite_exists = Favorite.where(product: @product, user: current_user) == [] ? false : true
    @bid = Bid.new
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def edit
    set_product
    @categories = Category.all
  end

  def create
    change_categories_imput
    @product = current_user.products.new(product_params)
    @categories = Category.all
    if @product.save
      redirect_to @product, notice: 'Your listing was successfuly created.'
    else
      render :new
    end

  end

  def update
    set_product
    @categories = Category.all
    change_categories_imput
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
      params.require(:product).permit(
        :title, 
        :price, 
        :location, 
        :condition, 
        :description, 
        :is_auction, 
        :auction_starting_price, 
        :auction_duration, 
        :is_sale, 
        :sale_price, 
        :shipment_type, 
        :shipment_fee,
        category_ids: [], 
        images: [], 
      )
    end
 
    def change_categories_imput
      params[:product][:category_ids] = params[:product][:category_ids][0].split(',')
    end
    

end
