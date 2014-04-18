class WelcomeController < ApplicationController

  layout 'new_layout', :only => [:login]

  def index
 	  @property = Property.all
  end

  def login
  end

end
