require 'spec_helper'

describe "analytics/new" do
  before(:each) do
    assign(:analytic, stub_model(Analytic,
      : MachineName => "MyString",
      :APIKey => "",
      :UserID => "",
      :method => "MyString",
      :method_time => 1,
      :method_success => false
    ).as_new_record)
  end

  it "renders new analytic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => analytics_path, :method => "post" do
      assert_select "input#analytic_ MachineName", :name => "analytic[ MachineName]"
      assert_select "input#analytic_APIKey", :name => "analytic[APIKey]"
      assert_select "input#analytic_UserID", :name => "analytic[UserID]"
      assert_select "input#analytic_method", :name => "analytic[method]"
      assert_select "input#analytic_method_time", :name => "analytic[method_time]"
      assert_select "input#analytic_method_success", :name => "analytic[method_success]"
    end
  end
end
