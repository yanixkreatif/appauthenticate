class HomesController < ApplicationController
 
  def index
  	authorize! :roll, :logs
  end
end
