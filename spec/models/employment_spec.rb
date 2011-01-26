require 'spec_helper'

describe Employment do
  it { should validate_presence_of :company_name }
end
