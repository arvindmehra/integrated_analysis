class PropertiesController < ApplicationController

	def index
		@properties = Property.all
	end

	def new
		@properties = Property.new
	end

	def show
		@property = Property.find(params[:id])
	end

	def edit
	end

	def create
		@property = Property.new(property_params) 
    if @property.save
      redirect_to properties_path
    else
      render 'new'
    end
	end

	def destroy
	end

	def update
	end

	private

    def property_params
      params.require(:property).permit(:project, :area, :price,
                                   :city,:sizes,:contact,:to_do)
    end

end
