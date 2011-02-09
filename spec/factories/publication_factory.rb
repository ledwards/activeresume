Factory.define :publication do |f|
  f.title { Faker::Lorem.sentence }
  f.author { Faker::Name.name }
  f.publication_date { Date.today }
  f.description { Faker::Lorem.paragraph }
  f.publisher { Faker::Lorem.sentence }
  f.hyperlink { "http://www.example.com" }
end
