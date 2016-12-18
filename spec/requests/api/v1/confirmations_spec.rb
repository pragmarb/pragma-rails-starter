# frozen_string_literal: true
RSpec.describe '/api/v1/confirmations' do
  describe 'POST /' do
    subject { -> { post api_v1_confirmations_path, body.to_json } }

    context 'when the email is valid' do
      let(:user) { create(:user, confirmed_at: nil) }

      let(:body) do
        {
          email: user.email
        }
      end

      it 'responds with 204 No Content' do
        subject.call
        expect(last_response.status).to eq(204)
      end
    end

    context 'when the email is invalid' do
      let(:body) do
        {
          email: 'jdoe@example.com'
        }
      end

      it 'responds with 204 No Content' do
        subject.call
        expect(last_response.status).to eq(204)
      end
    end
  end

  describe 'POST /:id/complete' do
    subject { -> { post complete_api_v1_confirmation_path(id: confirmation_token) } }

    context 'when the confirmation token is valid' do
      let(:user) { create(:user, confirmed_at: nil) }

      let(:confirmation_token) { user.confirmation_token }

      it 'responds with 204 No Content' do
        subject.call
        expect(last_response.status).to eq(204)
      end
    end

    context 'when the confirmation token is invalid' do
      let(:confirmation_token) { 'invalid' }

      it 'responds with 422 Unprocessable Entity' do
        subject.call
        expect(last_response.status).to eq(422)
      end
    end
  end
end
