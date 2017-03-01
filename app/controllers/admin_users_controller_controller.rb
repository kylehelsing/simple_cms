class AdminUsersController < ApplicationController

  layout 'Admin'

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    #Instantiate a new object using parameters
    @admin_user = AdminUser.new(admin_user_params)
    #save the object
    if @admin_user.save
      #redirect to index action
      flash[:notice] = "Admin User created successfully"
      redirect_to(:action => 'index')
    else
      #if fails, redisplay form so user can fix problems
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    #Find an existing object using parameters
    @admin_user = AdminUser.find(params[:id])
    #Update the object
    if @admin_user.update_attributes(admin_user_params)
    #If update succeeds, redirect to index action
      flash[:notice] = "Admin User updated successfully"
      redirect_to(:action => 'show', :id => @admin.id)
    else
      #if update fails, redisplay form so user can fix problems
       @admin_count = AdminUser.count
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin User '#{admin.username}' destroyed successfully"
    redirect_to(:action => 'index')
  end
  private
    def admin_user_params
      params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
