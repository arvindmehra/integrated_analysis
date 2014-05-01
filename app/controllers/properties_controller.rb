class PropertiesController < ApplicationController
  
  layout 'new_layout', :only => [:login]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
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

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  def send_query
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.build(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to welcome_index_path, notice: 'Property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property }
      else
        format.html { render action: 'new' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to welcome_index_path, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:photo, :project, :area, :city, :posted_at, :price, :size, :to_do,
       :contact, :professional_type, :data_available, :amenities, :name, :company,
       :email, :phone, :price_text, :comment_title, :comments, :floor,:image)
    end
end
