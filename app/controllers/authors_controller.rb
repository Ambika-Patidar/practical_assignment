class AuthorsController < ApplicationController
  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to authors_path, notice: 'Author was successfully created.' }
        format.json { render :index, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:name)
  end
end
