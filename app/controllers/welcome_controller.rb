class WelcomeController < ApplicationController

  before_action :authenticate_user!
  layout 'new_layout', :only => [:login]

  def index
 	  @property = Property.all
  end

  def login
  end

end
