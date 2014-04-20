class WelcomeController < ApplicationController

  layout 'new_layout', :only => [:login]

  def index
    params[:search][:min_sqrt]||= ""
    params[:search][:max_sqrt]||= ""
    params[:search][:min_price]||= ""
    params[:search][:max_price]||= ""
    params[:search][:to_do]||= ""
    @properties = Property.search_data(params[:search]).paginate(:page => params[:page], :per_page => 10)
  end

  def login
  end

  def search
    redirected_to welcome_search_path
  end

end
