class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product.category, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @product.category, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
