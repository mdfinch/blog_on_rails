Post.delete_all
Comment.delete_all

NUM_POST = 50

NUM_POST.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        created_at: created_at,
        updated_at: created_at
    )
    p.comments = rand(1..3).times.map do
        Comment.new(
        body: Faker::GreekPhilosophers.quote,
        created_at: created_at,
        updated_at: created_at
    )
    end
end

post = Post.all 
comment = Comment.all

puts Cowsay.say("Generated #{post.count} posts", :frogs)
puts Cowsay.say("Generated #{comment.count} comments", :tux)

