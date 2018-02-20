require 'rails_helper'

describe Api::V1::Posts do
  describe 'API Create posts' do
    let(:user) { create :user }
    let(:login) { Faker::Name.name }
    let(:title) { Faker::Hipster.sentence }
    let(:description) { Faker::Hipster.paragraph }

    let(:params) { { login: login, title: title, description: description } }

    subject { post '/api/posts', params }
    context 'create success, new user' do
      it {
        subject
        expect(response.status).to eq 200
      }
      it { expect { subject }.to(change { Post.count }) }
      it { expect { subject }.to(change { User.count }) }
    end

    context 'create success with user exist' do
      let(:login) { user.login }
      let(:users_count) { User.count }
      it {
        subject
        expect(response.status).to eq 200
        expect(User.count).to eq(users_count)
      }
      it { expect { subject }.to(change { Post.count }) }
    end

    context 'login is empty' do
      let(:login) { nil }
      it {
        subject
        expect(response.status).to eq 422
      }
      it { expect { subject }.not_to(change { Post.count }) }
    end

    context 'title is empty' do
      let(:title) { nil }
      it {
        subject
        expect(response.status).to eq 422
      }
      it { expect { subject }.not_to(change { Post.count }) }
    end

    context 'description is empty' do
      let(:description) { nil }
      it {
        subject
        expect(response.status).to eq 422
      }
      it { expect { subject }.not_to(change { Post.count }) }
    end
  end

  describe 'Top N posts by rating' do
    let(:quantity) { 10 }
    subject { get '/api/posts/top-rating', quantity: quantity }

    context 'GET check by status 200' do
      it {
        subject
        expect(response.status).to eq 200
      }
    end

    context 'GET check by status 200' do
      let(:quantity) { nil }

      it {
        subject
        expect(response.status).to eq 422
      }
    end
  end
end