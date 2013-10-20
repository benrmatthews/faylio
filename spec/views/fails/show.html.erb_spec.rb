require 'spec_helper'

describe "fails/show" do
  before(:each) do
    @fail = assign(:fail, stub_model(Fail,
      :headline => "Headline",
      :description => "Description",
      :lesson => "Lesson",
      :link => "Link",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Headline/)
    rendered.should match(/Description/)
    rendered.should match(/Lesson/)
    rendered.should match(/Link/)
    rendered.should match(/1/)
  end
end
