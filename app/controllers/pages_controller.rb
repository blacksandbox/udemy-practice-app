class PagesController < ApplicationController
  def home
    @homeMessage = "Hello World! My recipe app."
  end
end