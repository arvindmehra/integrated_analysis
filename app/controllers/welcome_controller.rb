class WelcomeController < ApplicationController

  layout 'new_layout', :only => [:login]
  before_action :authenticate_user!

  def index
    if params[:search].present?
      params[:search][:min_sqrt]||= ""
      params[:search][:max_sqrt]||= ""
      params[:search][:min_price]||= ""
      params[:search][:max_price]||= ""
      params[:search][:to_do]||= ""
      @properties = Property.search_data(params[:search])
    else
      @properties = Property.all.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def login
  end

  def search
    params[:search][:min_sqrt]||= ""
    params[:search][:max_sqrt]||= ""
    params[:search][:min_price]||= ""
    params[:search][:max_price]||= ""
    params[:search][:to_do]||= ""
    @properties = Property.search_data(params[:search]).paginate(:page => params[:page], :per_page => 10)
    redirected_to welcome_search_path(params.merge(params[:search]))
  end

end
