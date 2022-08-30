module API
  class Base < Grape::API
    include Devise::Controllers::Helpers
    helpers API::SharedHelpers

    mount API::V1::UserAPI

    route :any, '*path' do
      response = { message: 'The endpoint you have used is not a valid endpoint. Please refer to the documentation for all the accepted endpoints.', source: params }
      error! response, 404, 'Content-Type' => 'text/error'
    end
  end
end
