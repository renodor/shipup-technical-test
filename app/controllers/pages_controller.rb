# frozen_string_literal:true

class PagesController < ApplicationController
  def home
    connection = Faraday.new(
      url: 'http://httpbingo.org',
      params: { param: '1' },
      headers: { 'Content-Type' => 'application/json' }
    )

    response = connection.post('/post') do |req|
      req.params['limit'] = 100
      req.body = { query: 'chunky bacon' }.to_json
    end

    render json: { response: response.body }
  end
end
