require 'rails_helper'

RSpec.describe "items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/items/#{item.id}"
  end

  describe 'basic destroy' do
    let!(:item) { create(:item) }

    it 'updates the resource' do
      expect(ItemResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Item.count }.by(-1)
      expect { item.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
