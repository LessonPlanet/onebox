require "spec_helper"

describe Onebox::Engine::SlideshareOnebox do
  before(:all) do
    @link = "http://www.slideshare.net/TravelWorldPassport/12-local-traditions"
    fake(@link, response(described_class.template_name))
  end
  before(:each) { Onebox.defaults.cache.clear }

  let(:onebox) { described_class.new(link) }
  let(:html) { onebox.to_html }
  let(:data) { onebox.send(:data) }
  let(:link) { @link }

  it_behaves_like "an engine"

  describe "#to_html" do
    it "includes description" do
      expect(html).to include("12 Local traditions that will make")
    end

    it "includes still" do
      expect(html).to include("12localtraditions-130729070157-phpapp01-thumbnail-4")
    end
  end
end
