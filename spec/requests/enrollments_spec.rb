require 'spec_helper'

describe "Enrollments" do
  describe "GET /enrollments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get enrollments_path
      expect(response.status).to be(200)
    end
  end
end