class Post < ApplicationRecord
    before_validation(:capitalize_title)

    validates(:title, presence: true, uniqness: true )
    validates(:body, 
        presence: {message: "Body must be longer than 50 characters", length: {minimum: 50}}
    )

private

    def capitalize_title
        self.title = self.title.capitalize
    end

end

git add . && git commit -m ""