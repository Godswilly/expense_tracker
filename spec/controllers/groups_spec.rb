require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'before_actions' do
    it { should use_before_action(:require_user) }
    it { should use_before_action(:set_group) }
  end
  describe 'GET #index' do
    before do
      User.create(name: 'kalu')
      session[:author_id] = 1
      get :index
    end
    it { should render_template('index') }
    it { should_not render_template('show') }
  end
  describe 'GET #new' do
    before { get :new }
    it { should redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(name: 'kalu')
      session[:author_id] = 1
    end
    it do
      params = {
        group: {
          name: 'Cars'
        }
      }
      should permit(:name)
        .for(:create, params: params)
        .on(:group)
    end
  end
end
