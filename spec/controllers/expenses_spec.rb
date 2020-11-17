# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe 'before_action' do
    it { should use_before_action(:require_user) }
  end
  describe 'Post #create' do
    before do
      User.create(username: 'kalu')
      session[:user_id] = 1
    end
    it { should_not render_template('new') }
  end
end
