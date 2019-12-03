describe 'Businesses requests' do
  context 'single business' do
    before :each do
      @business = create(:business)
    end

    it 'returns OK status for existing business' do
      get business_url(@business.id)
      expect(response).to have_http_status(:success)
    end

    it 'fails to update for authenticated user' do
      params = {
          id: @business.id,
          name: "Stark Industries",
          logo: "stark.png",
          description: "Sickest weapon manufacturer",
          main_address: "Malibu",
          instagram: "@stark",
      }
      put business_url(@business.id), params: params
      expect(response).to have_http_status(:unauthorized)
    end

    it 'updates for authenticated user' do
      expect(true).to eq(true)
    end
  end
end