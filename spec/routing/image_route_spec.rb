require 'spec_helper'

describe "routing to images" do

  it "routes /images to images#index" do
    expect(get: '/images').to route_to(controller: 'images', action: 'index')
  end

end