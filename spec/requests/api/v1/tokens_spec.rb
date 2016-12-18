RSpec.describe '/api/v1/tokens' do
  describe 'POST /' do
    context 'with valid credentials' do
      it 'responds with 201 Created'
      it 'responds with a JWT'
    end

    context 'with invalid credentials' do
      it 'responds with 422 Unprocessable Entity'
    end
  end
end
