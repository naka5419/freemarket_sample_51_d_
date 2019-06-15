class Category < ApplicationRecord
  has_many :products
  has_ancestry

  def self.bring(number)
    ids = self.where('ancestry LIKE(?)', "#{number}/%").select(:id)

    array = []
      ids.each do |id|
        child_array = id.products
        if child_array.present?
          array << child_array
        end
      end

    category = []
    array.each{|child_array|
      child_array.each{ |product|
        category << product
      }
    }
    products = category.sort_by{ |a| a[:created_at] }
    return products
  end

end
