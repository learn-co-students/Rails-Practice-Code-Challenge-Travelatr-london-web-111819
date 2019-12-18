class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.order('created_at DESC').limit(5)
    end

    def average_blogger_age
        if self.bloggers
            self.bloggers.map(&:age).sum.to_f / self.bloggers.length
        else
           "This post has no bloggers"
        end
    end
end
