class WelcomeController < ApplicationController

  layout 'new_layout', :only => [:login]

  def index
    @user = current_user
    if params[:search].present?
      @properties = Property.search_data(params[:search])
    else
      @properties = Property.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def login
  end

  def search
    @properties = Property.properties.search_data(params[:search]).paginate(:page => params[:page], :per_page => 10)
    redirected_to welcome_search_path(params.merge(params[:search]))
  end

end
