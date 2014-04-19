class WelcomeController < ApplicationController

  layout 'new_layout', :only => [:login]

  def index
 	  @properties = Property.all.paginate(:page => params[:page], :per_page => 10)
  end

  def login
  end

end
