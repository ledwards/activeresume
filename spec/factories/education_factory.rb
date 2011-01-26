Factory.define :education do |f|
  f.major { Faker::Lorem.words(2).join(" ") }
  f.institution_name { Faker::Lorem.words(1).join(" ") }
  f.location { "#{Faker::Address.city}, #{Faker::Address.state_abbr}" }
  f.start_month { rand(12) }
  f.start_year { 2000 - rand(10) }
  f.end_month { rand(12) }
  f.end_year { 2011 - rand(10) }
  f.current false
  f.summary { Faker::Lorem.sentences(4) }
end

Factory.define :current_education do |f|
  f.major { Faker::Lorem.words(2).join(" ") }
  f.institution_name { Faker::Lorem.words(1).join(" ") }
  f.location { "#{Faker::Address.city}, #{Faker::Address.state_abbr}" }
  f.start_month { rand(12) }
  f.start_year { 2000 - rand(10) }
  f.current true
end