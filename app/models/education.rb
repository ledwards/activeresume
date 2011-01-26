class Education < ActiveRecord::Base
  validates_presence_of :institution_name
end
