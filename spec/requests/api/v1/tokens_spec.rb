RSpec.describe '/api/v1/tokens' do
  describe 'POST /' do
    subject { -> { post api_v1_tokens_path, credentials.to_json } }

    context 'with valid credentials' do
      let(:user) { create(:user) }
      let(:credentials) do
        {
          email: user.email,
          password: user.password
        }
      end

      it 'responds with 201 Created' do
        subject.call
        expect(last_response.status).to eq(201)
      end

      it 'responds with a JWT' do
        subject.call
        expect(parsed_response).to have_key('token')
      end
    end

    context 'with a wrong password' do
      let(:user) { create(:user) }
      let(:credentials) do
        {
          email: user.email,
          password: 'test123'
        }
      end

      it 'responds with 422 Unprocessable Entity' do
        subject.call
        expect(last_response.status).to eq(422)
      end
    end

    context 'with a non-existing user' do
      let(:credentials) do
        {
          email: 'jdoe@example.com',
          password: 'password'
        }
      end

      it 'responds with 422 Unprocessable Entity' do
        subject.call
        expect(last_response.status).to eq(422)
      end
    end

    context 'with an unconfirmed user' do
      let(:user) { create(:user, confirmed_at: nil) }
      let(:credentials) do
        {
          email: user.email,
          password: user.password
        }
      end

      it 'responds with 401 Unauthorized' do
        subject.call
        expect(last_response.status).to eq(401)
      end
    end
  end
end
