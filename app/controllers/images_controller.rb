class ImagesController < ApplicationController

  def index
    @images = Docker::Image.all.map do |i|
      Image.new(i)
    end
  end

end