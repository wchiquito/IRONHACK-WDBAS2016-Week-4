class AsciisController < ApplicationController
  def new

  end

  def create
    @artii = Artii::Base.new(:font => ('doh')).asciify params[:text_ascii][:user_text]
    render 'results'
  end
end
