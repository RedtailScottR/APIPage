require 'spec_helper'

describe "partners/edit" do
  before(:each) do
    @partner = assign(:partner, stub_model(Partner,
      :name => "MyString",
      :email => "MyString",
      :company => "MyText",
      :url => "MyText"
    ))
  end

  it "renders the edit partner form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => partners_path(@partner), :method => "post" do
      assert_select "input#partner_name", :name => "partner[name]"
      assert_select "input#partner_email", :name => "partner[email]"
      assert_select "textarea#partner_company", :name => "partner[company]"
      assert_select "textarea#partner_url", :name => "partner[url]"
    end
  end
end
