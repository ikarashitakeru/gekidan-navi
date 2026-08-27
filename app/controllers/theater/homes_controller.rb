class Theater::HomesController < ApplicationController
  before_action :authenticate_theater!

  def top
  end
end