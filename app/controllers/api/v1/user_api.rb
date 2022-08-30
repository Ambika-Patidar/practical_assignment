module API
  module V1
    class UserAPI < Grape::API
      version 'v1', using: :path
      include Devise::Controllers::Helpers
      format :json

      namespace :users do
        desc 'User signup'
        params do
          requires :email, type: String, desc: 'Email of the user'
          requires :password, type: String, desc: 'password of the user'
          requires :first_name, type: String, desc: 'first Name of the user'
          requires :last_name, type: String, desc: 'Last Name of the user'
        end

        post '/signup' do
          user = User.new params
          begin
            user.save
            response = {
              message: 'The user created successfully.',
              source: params
            }
            response
          rescue StandardError => e
            response = { message: e }
            error! response, 422, 'Content-Type' => 'text/error'
          end
        end

        desc 'user sign in'
        params do
          requires :email, type: String, desc: 'Email of the user'
          requires :password, type: String, desc: 'password of the user'
        end

        post '/login' do
          user = User.find_by(email: params[:email])
          response = { message: 'Invalid params', status: 401, source: params, headers: {} }
          payload = { email: params[:email] }
          if user.valid_password?(params[:password])
            token = JWT.encode payload, nil, 'none'
            response[:message] = 'Login Successfully'
            response[:headers]['Authorization'] = token
            response[:status] = 200
          end
          response
        end
      end

      namespace :books do
        before do
          authenticate_user! headers['Authorization']
        end

        desc 'search books'
        params do
          requires :name, type: String, desc: 'Name of the book'
          optional :description, type: String, desc: 'Description of the Book'
          requires :category, type: String, desc: 'Category name'
          requires :author, type: String, desc: 'Author name'
        end

        get '/search' do
          category = Category.find_by(name: params[:category])
          author = Author.find_by(name: params[:author])
          response = { books: [] }
          books = if params[:description].present?
                    Book.where(name: params[:name], category_id: category.id, description: parmas[:description], author_id: author.id)
                  else
                    Book.where(name: params[:name], author_id: author.id, category_id: category.id)
                  end
          response[:books] = books if books.present?
          response
        end

        namespace :favorite do
          desc 'Add favorite book'
          params do
            requires :name, type: String, desc: 'Name of the book'
            requires :description, type: String, desc: 'Description of the Book'
          end

          post '/add' do
            book = Book.find_by(name: params[:name], description: params[:description])
            response = { message: 'Record Not found', status: 404, source: params }
            if book.present?
              @user.favorites.create(book_id: book&.id)
              response[:message] = 'Favorite book added successfully'
              response[:status] = 200
            end
            response
          end

          desc 'List of favorities books'

          get '/list' do
            fav_book_ids = @user.favorites.pluck(:book_id)
            response = { books: [] }
            response[:books] = Book.where(id: fav_book_ids) if fav_book_ids.present?
            response
          end
        end
      end
    end
  end
end
