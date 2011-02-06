Factory.define :portfolio_item do |f|
  f.title { Faker::Lorem.sentence }
  f.institution_name { Faker::Lorem.sentence }
  f.location { Faker::Address.city }
  f.description { Faker::Lorem.paragraph }
  f.start_month { rand(12) }
  f.start_year { 2000 - rand(10) }
  f.end_month { rand(12) }
  f.end_year { 2011 - rand(10) }
  f.current false
end

Factory.define :current_portfolio_item do |f|
  f.title { Faker::Lorem.sentence }
  f.institution_name { Faker::Lorem.sentence }
  f.location { Faker::Address.city }
  f.description { Faker::Lorem.paragraph }
  f.start_month { rand(12) }
  f.start_year { 2000 - rand(10) }
  f.current true
end