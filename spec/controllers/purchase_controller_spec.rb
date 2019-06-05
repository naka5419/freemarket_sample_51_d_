require 'rails_helper'

describe PurchaseController, type: :controller do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end












# require 'rails_helper'

# describe PurchaseController, type: :controller do
#   let(:user) { create(:user) }
#   # userをcreateし、let内に格納

#   describe 'GET #index' do
#     before do
#       login_user user
#       # controller_macros.rb内のlogin_userメソッドを呼び出し
#     it "renders the :index template" do
#       get :index
#     expect(response).to render_template :index
#       end
#     end
#   end
# end


# require 'rails_helper'

# RSpec.describe PurchaseController, :type => :controller do
#   describe "GET #pay" do
#     # userをFactoryBotで作る
#     let!(:user) { build(:user) }
#     # 作ったユーザでログインする
#     before do
#       login_user user
#     end

#     it "assigns the requested card to card" do
#       card = create(:card)
#       get :pay, params: { id: card }
#       expect(assigns(:card)).to eq card
#     end

#     it "renders the :pay template" do
#       get :pay
#       expect(response).to render_template :index
#       end
#   end
# end







# describe 'GET #pay' do
# it "assigns the requested card to card" do
#   card = create(:card)
#   get :pay, params: { id: card }
#   expect(assigns(:card)).to eq card
# end

# it "renders the :edit template" do
#   get :index
#   expect(response).to render_template :index
# end
# end