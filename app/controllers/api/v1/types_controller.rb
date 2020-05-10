class Api::V1::TypesController < ApplicationController
  before_action :check_user

  def index
    @types = Type.all
  end
end
