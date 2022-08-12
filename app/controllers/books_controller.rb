class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @users = @book.user
    @user = current_user.id
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:notice] = 'Book was successfully destroyed.'
      redirect_to '/books'
    else
      @books = Book.all
      @book = Book.new
      @user = current_user
      render :index
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
