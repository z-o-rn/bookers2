class BooksController < ApplicationController

  def about
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render template: "books/index"
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book_new = Book.new
    @book = Book.find (params[:id])
    @user = @book.user
    @book_comments = @book.book_comments
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find (params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render template: "books/edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
