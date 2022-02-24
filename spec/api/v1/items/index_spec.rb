require 'rails_helper'

RSpec.describe "items#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/items", params: params
  end

  describe 'basic fetch' do
    let!(:item1) { create(:item) }
    let!(:item2) { create(:item) }

    it 'works' do
      expect(ItemResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['items'])
      expect(d.map(&:id)).to match_array([item1.id, item2.id])
    end
  end
end
