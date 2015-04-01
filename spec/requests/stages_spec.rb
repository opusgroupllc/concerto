require 'rails_helper'

RSpec.describe "Stages", type: :request do
  describe "GET /stages" do
    it "works! (now write some real specs)" do
      get stages_path
      expect(response).to have_http_status(200)
    end
  end
end
