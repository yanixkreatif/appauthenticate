class UserController < ApplicationController
before_action :set_type, only: [:edit, :update, :destroy]
 load_and_authorize_resource
   def index
    @users = User.all
  end  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to '/user'
    else
      render :action => 'new'
    end
  end

  def edit 
  end

  def update 
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
 
      redirect_to '/user'
      
    else
      render :action => 'edit'
    end
  end

  def destroy 
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to '/user'
    end
  end 
protected
  def set_type
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:password,:role,:password_confirmation)
    end
end