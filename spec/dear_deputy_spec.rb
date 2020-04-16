require_relative '../lib/dear_deputy.rb'


describe "the get_names method" do
  it "should not be nil" do
    expect(get_names()).not_to be_nil
  end

end


describe "the get_links method" do
  it "should not be nil" do
    expect(get_links()).not_to be_nil
  end

end


describe "the get_emails method" do
  it "should not be nil" do
    expect(get_emails("")).not_to be_nil
  end
end




