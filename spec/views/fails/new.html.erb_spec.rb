require 'spec_helper'

describe "fails/new" do
  before(:each) do
    assign(:fail, stub_model(Fail,
      :headline => "MyString",
      :description => "MyString",
      :lesson => "MyString",
      :link => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new fail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fails_path, "post" do
      assert_select "input#fail_headline[name=?]", "fail[headline]"
      assert_select "input#fail_description[name=?]", "fail[description]"
      assert_select "input#fail_lesson[name=?]", "fail[lesson]"
      assert_select "input#fail_link[name=?]", "fail[link]"
      assert_select "input#fail_user_id[name=?]", "fail[user_id]"
    end
  end
end
