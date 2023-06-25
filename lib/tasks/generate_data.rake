namespace :db do
    desc "Generate 1000 todos with 100000 random notes"

    task generate_data: :environment do

      tags = Tag.all

      10.times do
        todo = Todo.create(title: Faker::Lorem.sentence(word_count: 3), completed: [true, false].sample)
  
        rand(0..3).times do
          todo.notes.create(content: Faker::Lorem.sentence(word_count: 10))
        end

        todo.tags << tags.sample(rand(0..3))
  
      end
  
      puts "Data generated successfully"
    end
  end
  