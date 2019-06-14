class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def index
    ladies_ids = Category.where('ancestry LIKE(?)', "1/%").select(:id)

     lady_array = []
      ladies_ids.each do |id|
        products = id.products
        if products.present?
        lady_array << products
        end
      end

     category_ladies = []
     lady_array.each{|products|
       products.each{ |product|
         category_ladies << product
       }
     }
     @ladies = category_ladies.sort_by{ |a| a[:created_at] }


    mens_ids = Category.where('ancestry LIKE(?)', "2/%").select(:id)

    mens_array = []
     mens_ids.each do |id|
       products = id.products
       if products.present?
       mens_array << products
       end
     end

    mens_category = []
    mens_array.each{|products|
      products.each{ |product|
        mens_category << product
      }
    }
    @mens = mens_category.sort_by{ |a| a[:created_at] }


    kids_ids = Category.where('ancestry LIKE(?)', "3/%").select(:id)

    kids_array = []
     kids_ids.each do |id|
       products = id.products
       if products.present?
       kids_array << products
       end
     end

    kids_category = []
    kids_array.each{|products|
      products.each{ |product|
        kids_category << product
      }
    }
    @kids = kids_category.sort_by{ |a| a[:created_at] }

    cosmetics_ids = Category.where('ancestry LIKE(?)', "7/%").select(:id)

    cosmetics_array = []
    cosmetics_ids.each do |id|
       products = id.products
       if products.present?
       cosmetics_array << products
       end
     end

    cosmetics_category = []
    cosmetics_array.each{|products|
      products.each{ |product|
        cosmetics_category << product
      }
    }
    @cosmetics = cosmetics_category.sort_by{ |a| a[:created_at] }

    @chanels = Product.where(bland: "CHANEL")
    @vuittons = Product.where(bland: "LOUIS VUITTON")
    @supremes = Product.where(bland: "Supreme")
    @nikes = Product.where(bland: "NIKE")
  end

  def show
    @product = Product.find(params[:id])
    category_id = @product.category_id
    @products = Category.find(category_id).products
  end

  def create
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition, :size, :bland, :shipping_cost, :shipping_method, :source_area, :shipping_day, :status, :price, images: []).merge(seller_id: current_user.id)
  end
end
