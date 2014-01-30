require 'spec_helper'

describe ImagesController do

  let(:image) { double("Image") }
  let(:docker_image) { double('Docker::Image') }

  before do
    allow('Docker::Image').to receive(:all).and_return([docker_image])
  end

  it "assigns @images" do
    get :index
    expect(assigns(:images)).to eq([image])
  end

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
end
