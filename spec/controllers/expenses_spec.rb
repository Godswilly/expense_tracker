require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe 'before_action' do
    it { should use_before_action(:require_user) }
  end
  describe 'GET #index' do
    before do
      User.create(username: 'kalu')
      session[:user_id] = 1
      get :index
    end
    it { should render_template('index') }
    it { should_not render_template('external') }
  end
  describe 'GET #external' do
    before do
      User.create(username: 'kalu')
      session[:user_id] = 1
      get :external
    end
    it { should render_template('external') }
    it { should_not render_template('index') }
  end
  describe 'GET #new' do
    before { get :new }
    it { should redirect_to(login_path) }
  end
  describe 'Post #create' do
    before do
      User.create(username: 'kalu')
      session[:user_id] = 1
    end
    it do
      params = {
        expense: {
          name: 'Corolla',
          amount: 1_000_000,
          group_id: 1
        }
      }
      should permit(:name, :amount, :group_id)
        .for(:create, params: params)
        .on(:expense)
    end
  end
end
