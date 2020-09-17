require 'rails_helper'

RSpec.describe 'Websites API', type: :request do
  # create the data we'll be using
  let!(:member) { create(:member) }
  let!(:website) { create(:website, member_id: member.id) }

  # return a website through a member - GET /members/:member_id/website
  describe 'GET /members/:member_id/website' do
    before { get "/members/#{member.id}/website" }

    context 'when member has a website' do
      it 'returns the website' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(website.id)
      end

      it 'returns 200 status' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # create website through a member - POST /members/:member_id/website
  describe 'POST /members/:member_id/website' do
    let(:valid_data) { { url: 'http://example.com' } }

    context 'when data is valid' do
      before { post "/members/#{member.id}/website", params: valid_data }

      it 'creates a website' do
        expect(JSON.parse(response.body)['url']).to eq('http://example.com')
      end

      it 'returns 201 status' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # TODO: add checks for UPDATE and DELETE
  # we're not making much use of DELETE in this project, but maybe some
  # UPDATE...
end
