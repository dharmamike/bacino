require 'spec_helper'

describe "routing to root paths" do

  it "routes / to dashboard#index" do
    expect(get: '/').to route_to(controller: 'dashboard', action: 'index')
  end

end