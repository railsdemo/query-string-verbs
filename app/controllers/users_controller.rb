class UsersController < ApplicationController
  
  def list
  	@users = User.all

  	if params[:v] == "new" # GET
      @user = User.new
      @path = 'users/?v=create'

    elsif params[:v] == "create" # POST
    	@user = User.new(user_params)
	    if @user.save
	      redirect_to @user, notice: 'User was successfully created.'
	    else
	      render action: 'new'
	    end

    #else # GET
      # Additional code for list GET
    
    end

  end

  def view
  	@user = User.find(params[:id])

    if params[:v] == "edit" # GET

      @path = '/users/'+params[:id]+'?v=update'

    elsif params[:v] == "update" and (params[:_method] == "patch" or params[:_method] == "put") # PATCH/PUT

      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render action: 'edit'
      end

    elsif params[:v] == "destroy" and params[:_method] == "delete" # DELETE

      @user.destroy
      redirect_to users_url

    #else # GET
      # Additional code for view GET

    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
end
