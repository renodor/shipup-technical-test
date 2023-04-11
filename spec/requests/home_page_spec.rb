# frozen_string_literal:true

require 'rails_helper'

RSpec.describe 'Home page spec', type: :request do
  describe 'GET /' do
    it 'is successful' do
      get '/'

      expect(response).to have_http_status(:ok)
    end
  end
end
