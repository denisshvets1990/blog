require 'rails_helper'

describe Api::V1::Post::Ips do
  context 'Return ips where users posted more one post' do
    it 'GET check value success' do
      get '/api/post/ips'
      expect(response.status).to eq 200
    end
  end
end
