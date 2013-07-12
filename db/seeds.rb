require 'faker'

# 10.times do
#   title = Faker::Lorem.words(num = 3).join(' ')
#   List.create(name: title)
# end


List.all.each do |list|
  description = Faker::Lorem.sentence(word_count = 4)
  list.add_task(description)
end
