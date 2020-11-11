# spec/models/auction_spec.rb

require 'rails_helper'



RSpec.describe Article, :type => :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.title = "Anything"
    subject.text = "Anything"
  end

  subject {
    described_class.new(title: "Anything",
                        text: "Lorem ipsum")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a text" do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
