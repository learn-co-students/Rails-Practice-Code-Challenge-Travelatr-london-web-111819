class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_destination_posts
        self.posts.last(5)
    end

    def featured_post
        self.posts.order('likes DESC').first
    end
end
