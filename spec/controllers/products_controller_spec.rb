require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #show' do
    it "assigns the requested product to @product" do
      bland = create(:bland)
      product = build(:product, bland_id: bland.id)
      # get :show, params: {id: product}
      # expect(assigns(:product)).to eq product
    end

    it "renders the :show template" do
    end
  end

end
