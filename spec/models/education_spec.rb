require 'spec_helper'

describe Education do
  it { should validate_presence_of :institution_name }
end
