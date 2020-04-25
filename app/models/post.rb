class Post < ApplicationRecord
    before_save(:capitalize_title)
    has_many(:comments, dependent: :destroy)

    validates(:title, presence: true, uniqueness: true )
    validates(:body, 
        presence: {message: "Body must be longer than 50 characters", length: {minimum: 50}}
    )

private

    def capitalize_title
        self.title = self.title.capitalize
    end

end