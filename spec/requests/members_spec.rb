require 'rails_helper'

RSpec.describe 'Members API', type: :request do
  # create the data we'll be using
  let!(:members) { create_list(:member, 4) }
  let(:member_id) { members.first.id }

  # return all the members - GET /members
  describe 'GET /members' do
    before { get '/members' }

    it 'returns members' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(4)
    end
  end

  # return specific member - GET /members/:id
  describe 'GET /members/:id' do
    before { get "/members/#{member_id}" }

    context 'if member exists' do
      it 'returns the member' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(member_id)
      end

      it 'returns 200 status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'if member does not exists' do
      let(:member_id) { 12345 }

      it 'returns 404 status' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # create member - POST /members
  describe 'POST /members' do
    let(:valid_data) { { name: 'Some Person' } }

    context 'when data is valid' do
      before { post '/members', params: valid_data }

      it 'creates a member' do
        expect(JSON.parse(response.body)['name']).to eq('Some Person')
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
