class BooksController < ApplicationController

def index
  @book = Book.new
  @books = Book.all
  @user = current_user
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @user = current_user
  if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :index
  end
end

  def show
    @new_book=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
    @book_comment = BookComment.new
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
    render :edit 
    else
    redirect_to book_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path
    else
    @books = Book.all
    render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body,:profile_image)
  end
end
