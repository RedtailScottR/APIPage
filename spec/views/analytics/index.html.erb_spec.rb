require 'spec_helper'

describe "analytics/index" do
  before(:each) do
    assign(:analytics, [
      stub_model(Analytic,
        : MachineName => " Machine Name",
        :APIKey => "",
        :UserID => "",
        :method => "Method",
        :method_time => 1,
        :method_success => false
      ),
      stub_model(Analytic,
        : MachineName => " Machine Name",
        :APIKey => "",
        :UserID => "",
        :method => "Method",
        :method_time => 1,
        :method_success => false
      )
    ])
  end

  it "renders a list of analytics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => " Machine Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Method".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
