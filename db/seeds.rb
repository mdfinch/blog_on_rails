Post.delete_all
Comment.delete_all
User.delete_all

NUM_POST = 50
NUM_USER = 10
PASSWORD = '123'

super_user = User.create(
    first_name: 'jon',
    last_name: 'snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

NUM_USER.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: Faker::Internet.email,
        password: PASSWORD
    )
end

users = User.all

NUM_POST.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        user: users.sample,
        created_at: created_at,
        updated_at: created_at
    )
    if p.valid?
        p.comments = rand(1..3).times.map do
        Comment.new(
            body: Faker::GreekPhilosophers.quote,
            user: users.sample,
            created_at: created_at,
            updated_at: created_at
        )
        end
    end
end

post = Post.all 
comment = Comment.all

puts Cowsay.say("Generated #{post.count} posts", :frogs)
puts Cowsay.say("Generated #{comment.count} comments", :tux)
puts Cowsay.say("Generated #{users.count} users", :sheep)


