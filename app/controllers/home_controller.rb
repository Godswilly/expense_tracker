# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :require_user

  def index; end
end
