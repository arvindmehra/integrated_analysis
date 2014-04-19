class WelcomeController < ApplicationController

  layout 'new_layout', :only => [:login]

  def index
 	  @properties = Property.all
  end

  def login
  end

end
