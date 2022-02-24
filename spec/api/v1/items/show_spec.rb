require 'rails_helper'

RSpec.describe "items#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/items/#{item.id}", params: params
  end

  describe 'basic fetch' do
    let!(:item) { create(:item) }

    it 'works' do
      expect(ItemResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('items')
      expect(d.id).to eq(item.id)
    end
  end
end
