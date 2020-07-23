require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  describe 'GET #index' do
    before(:example) do
      # Arrange
      @first_subscription = create(:subscription)
      @last_subscription = create(:subscription)

      # Act
      get '/subscriptions'
      @json_response = JSON.parse(response.body)
    end
    
    it 'returns http success code' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON response contains the correct number of entries' do
      expect(@json_response['subscriptions'].count).to eq(2)
    end

    it 'JSON response body contains the expected attributes' do
      expect(@json_response['subscriptions'][0]).to include({
        'id' => @first_subscription.id,
        'name' => @first_trail.name,
        'difficulty' => @first_trail.difficulty
      })
    end
  end

  describe 'POST #create' do
    context 'when the subscription is valid' do
      before(:example) do
        @subscription_params = attributes_for(:subscription)
        post '/subscriptions', params: { subscription: @subscription_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Trail to the database' do
        expect(Subscription.last.name).to eq(@subscription_params[:name])
      end
    end

    context 'when the trail is invalid' do
      before(:example) do
        @trail_params = attributes_for(:trail, :invalid)
        post '/trails', params: { trail: @trail_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end

      it 'returns status unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end

      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Name can't be blank")
      end
    end
  end

  describe 'PUT #update' do
    context 'when the params are valid' do
      before(:example) do
        @trail = create(:trail)
        @updated_name = 'Updated Trail'
        put "/trails/#{@trail.id}", params: { trail: { name: @updated_name } }, headers: authenticated_header
      end

      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the trail in the database' do
        expect(Trail.find(@trail.id).name).to eq(@updated_name)
      end
    end

    context 'when the params are invalid' do
      before(:example) do
        @trail = create(:trail)
        put "/trails/#{@trail.id}", params: { trail: { name: nil } }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end

      it 'returns a unprocessable entity response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'has the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:example) do
      trail = create(:trail)
      delete "/trails/#{trail.id}", headers: authenticated_header
    end

    it 'has a http no content response status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'removes the trail from the database' do
      expect(Trail.count).to eq(0)
    end
  end
end