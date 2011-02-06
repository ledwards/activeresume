require 'spec_helper'

describe PortfolioItem do
  it "has a valid factory" do
    Factory.build(:portfolio_item).should be_valid
  end
  
  it { should validate_presence_of :title }
  
  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
              allowing('image/png', 'image/gif', 'image/jpeg', 'image/x-png', 'image/pjepg').
              rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:image).less_than(2.megabytes) }
end