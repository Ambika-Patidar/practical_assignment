class BooksController < ApplicationController
  # GET /books or /books.json
  def index
    @books = Book.all.includes(:author, :category)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def reports
    @book = Book.find_by(id: Favorite.select(:book_id).group(:book_id).max.book_id)
  end

  private

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:name, :description, :author_id, :category_id)
  end
end
