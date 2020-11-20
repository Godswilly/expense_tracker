require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it { should_not redirect_to(login_path) }
    it { should render_template('new') }
  end
  describe 'Post #create' do
    it do
      params = {
        user: {
          name: 'Kalu'
        }
      }
      should permit(:name)
        .for(:create, params: params)
        .on(:user)
    end
  end
end
