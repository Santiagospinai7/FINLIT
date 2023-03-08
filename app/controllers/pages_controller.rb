class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @data = {"savings" => 30, "lack" => 70}
  end
end
