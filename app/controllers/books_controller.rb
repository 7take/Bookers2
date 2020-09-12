class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user
  end

  def show
    @book_new = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def create
      @book =Book.new(book_params)
      @book.user_id = current_user.id
      @user = current_user
	if  @book.save
  		redirect_to book_path(@book.id), notice: 'You have creatad book successfully.'
  	else
  		@books =Book.all
  		render :index
  	end
  end

    def edit
      @book = Book.find(params[:id])
      if @book.user_id == current_user.id
        @book = Book.find(params[:id])
        render :edit
      else
        redirect_to action: :index
      end
    end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to book_path(@book), notice: 'You have updated book successfully.'
  	else
  		render :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body )
  end

end