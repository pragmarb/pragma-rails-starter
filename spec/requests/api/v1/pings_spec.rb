# frozen_string_literal: true

RSpec.describe '/api/v1/pings' do
  describe 'POST /' do
    subject { -> { post api_v1_pings_path, params.to_json } }

    let(:params) { { message: Time.zone.now.to_i } }

    it 'responds with 201 Created' do
      subject.call
      expect(last_response.status).to eq(201)
    end

    it 'responds with the message' do
      subject.call
      expect(parsed_response['message']).to eq(params[:message])
    end

    context "when the 'message' property is missing" do
      let(:params) { {} }

      it 'responds with 422 Unprocessable Entity' do
        subject.call
        expect(last_response.status).to eq(422)
      end

      it 'responds with an error type' do
        subject.call
        expect(parsed_response).to have_key('error_type')
      end

      it 'responds with an error message' do
        subject.call
        expect(parsed_response).to have_key('error_message')
      end
    end
  end
end
