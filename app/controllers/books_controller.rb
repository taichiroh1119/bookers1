class BooksController < ApplicationController
  def top

  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new

  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book)
    else
      render :index
    end

  end
  def edit
    @book = Book.find(params[:id])

  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.save
      flash[:notice] = "Book was successfully destroyed."
      book.destroy
      redirect_to books_path
    else
      render action: :find
    end
  end
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
