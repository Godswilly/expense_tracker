# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'before_actions' do
    it { should use_before_action(:require_user) }
    it { should use_before_action(:set_group) }
  end
  describe 'GET #show' do
    before do
      User.create(username: 'kalu')
      session[:user_id] = 1
    end
    it { should_not render_template('show') }
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
    it { should_not render_template('new') }
  end
end
