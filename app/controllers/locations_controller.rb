class LocationsController < ApplicationController

  def index
    @locations = Location.all

    if params[:v] == "new" # GET
  
      @location = Location.new
      @path = 'locations/?v=create'

    elsif params[:v] == "create" # POST

      @location = Location.new(location_params)

      respond_to do |format|
        if @location.save
          format.html { redirect_to @location, notice: 'Location was successfully created.' }
          format.json { render action: 'show', status: :created, location: @location }
        else
          format.html { render action: 'new' }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end

    #else # GET
      # Additional code for the scaffolded index action would go here
    end
  end


  def show
    @location = Location.find(params[:id])

    if params[:v] == "edit" # GET

      @path = '/locations/'+params[:id]+'?v=update'

    elsif params[:v] == "update" and (params[:_method] == "patch" or params[:_method] == "put") # PATCH/PUT

      respond_to do |format|
        if @location.update(location_params)
          format.html { redirect_to @location, notice: 'Location was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end

    elsif params[:v] == "destroy" and params[:_method] == "delete" # DELETE

      @location.destroy
      respond_to do |format|
        format.html { redirect_to locations_url }
        format.json { head :no_content }
      end

    #else # GET
      # Additional code for the scaffolded show action would go here

    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name)
    end
end
