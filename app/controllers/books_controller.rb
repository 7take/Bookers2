class BooksController < ApplicationController

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  	if  @book.save
  		redirect_to books_path(@book), notice: 'You have creatad book successfully.'
  	else
  		@books =Book.all
  		render :index
  		redirect_to books_path
  	end
  end

  def create
	if  @book.save
  		redirect_to books_path(@book), notice: 'You have creatad book successfully.'
  	else
  		@books =Book.all
  		render :index
  		return
  		redirect_to books_path
  	end
  end

  def edit
  	@book = Book.find(params[:id])
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
  	params.require(:book).permit(:title, :opinion)
  end

end