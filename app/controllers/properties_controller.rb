class PropertiesController < ApplicationController
  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all

    render json: @properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])

    render json: @property
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(safe_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    @property = Property.find(params[:id])

    if @property.update(params[:property])
      head :no_content
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    head :no_content
  end

  def safe_params
    params.require(:property).permit(:businessName, :streetAddress, :city, :state, :zip, :mdu, :units, :content)
  end
end
