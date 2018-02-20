require 'rails_helper'

describe Api::V1::Post::Estimates do
  describe 'Create post estimation' do
    let(:user) { create :user }
    let(:post_db) { create :post, user: user }

    let(:post_id) { post_db.id }
    let(:estimate) { 4 }
    let(:params) { { post_id: post_id, estimate: estimate } }

    subject { post '/api/post/estimates', params }

    context 'create success' do
      it {
        subject
        expect(response.status).to eq 200
      }
      it { expect { subject }.to(change { Post::Estimate.count }) }
    end

    context 'post_id is blank' do
      let(:post_id) { nil }

      it {
        subject
        expect(response.status).to eq 422
      }
      it { expect { subject }.not_to(change { Post::Estimate.count }) }
    end

    context 'post_id is not found' do
      let(:post_id) { Post.last.present? ? Post.last.id + 100 : 100 }

      it {
        subject
        expect(response.status).to eq 404
      }
      it { expect { subject }.not_to(change { Post::Estimate.count }) }
    end

    context 'estimate is blank' do
      let(:estimate) { nil }

      it {
        subject
        expect(response.status).to eq 422
      }
      it { expect { subject }.not_to(change { Post::Estimate.count }) }
    end
  end
end
