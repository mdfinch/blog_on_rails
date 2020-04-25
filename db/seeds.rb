Post.delete_all

NUM_POST = 50

NUM_POST.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        created_at: created_at,
        updated_at: created_at
    )
end

post = Post.all 

puts Cowsay.say("Generated #{post.count} posts", :frogs)
