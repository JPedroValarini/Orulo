class UsersController < ApplicationController
 # GET /users

 def index   
  @user = current_user.user    
  render json: @user  
end

# GET /api/v1/users/1

def show    
  render json: @user    
end

# POST /users

def create    
  @user = User.new(users_params)    
  if @user.save    
    render json: @user, status: :created    
  else    
    render json: @user.errors, status: :unprocessable_entity    
  end    
end

# PATCH/PUT /users/1

def update
  @user = users.find(params[:id])  
  if @user.update(users_params)    
    render json: @user    
  else   
    render json: @user.errors, status: :unprocessable_entity    
  end    
end

# DELETE /users/1    
def destroy   
  @user.destroy    
end    

private    
  def set_users
    @user = User.find(params[:id])   
  end  
  # Only allow a trusted parameter "white list" through.  
  def users_params   
    params.require(:user).permit(:name, :email, :password)    
  end   

  def require_authorization!    
    unless current_user == @user    
      render json: {}, status: :forbidden    
  end    
end 
end

