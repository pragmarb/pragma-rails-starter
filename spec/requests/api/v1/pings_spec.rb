RSpec.describe '/api/v1/pings' do
  describe 'POST /' do
    it 'responds with 204 No Content' do
      post api_v1_pings_path
      expect(last_response.status).to eq(204)
    end
  end
end
