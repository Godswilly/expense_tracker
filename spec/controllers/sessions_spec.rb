require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before { get :new }
    it { should render_template('new') }
    it { should_not redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(name: 'kalu')
      @user = User.find_by(name: 'kalusha')
    end
    it { should_not render_template('new') }
  end
end
