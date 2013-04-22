require 'spec_helper'

describe "analytics/show" do
  before(:each) do
    @analytic = assign(:analytic, stub_model(Analytic,
      : MachineName => " Machine Name",
      :APIKey => "",
      :UserID => "",
      :method => "Method",
      :method_time => 1,
      :method_success => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/ Machine Name/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Method/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
