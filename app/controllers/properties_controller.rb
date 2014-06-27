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
    @property = Property.create(property_params)
    # @property = Property.new(safe_params)

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

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def property_params
    params.require(:property).permit(:business_name, :street_address, :city, :state, :zip, :mdu, :units, :content)
  end
end
