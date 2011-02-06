class Project < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :image, 
      :styles => { :large => "780x585>", :thumbnail => "125x125#" },
      :default_url => '/images/missing_:style.png',
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :path => ":image/:id/:style.:extension"
      
  validates_presence_of :title  
  
  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/x-png', 'image/pjepg']
end