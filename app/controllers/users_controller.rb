class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  
  def index
    @users = User.all
  end

  
  def show
    
  end

  
  # def new
  #   @user = User.new
  # end

  def edit
  end

  
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: "User was successfully created." }
        
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
        
  #     end
  #   end
  # end

  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
      
      else
        format.html { render :edit, status: :unprocessable_entity }
       
      end
    end
  end

  
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      
    end
  end

  private
      def set_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          redirect_to root_path, alert: "Utilisateur introuvable."
      end

    def correct_user
      unless current_user == @user
        flash[:alert] = "Accès interdit."
        redirect_to root_path
      end
    end

    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :description, :password, :password_confirmation)
    end
end
