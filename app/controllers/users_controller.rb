class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    #binding.pry
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user.id)
    else
      render template: "users/edit"
    end
  end

  def sign_in
    @user = User.new
    render layout: "not_login"
  end


  private

    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end

end