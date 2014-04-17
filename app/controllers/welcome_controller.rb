class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
 	@property = Property.all
  end

end
