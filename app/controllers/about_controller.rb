class AboutController < ApplicationController

  #skip_before_action :authenticate_user!

  def about
    render 'about/index'
  end

end