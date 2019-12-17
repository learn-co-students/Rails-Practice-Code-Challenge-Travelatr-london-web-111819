class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, {
        presence: true,
        uniqueness: :true
    }
    validates :age, {
        length: { minimum: 1 }
    }
    validates :bio, {
        length: { minimum: 30 }
    }

    def total_post_likes
        self.posts.sum('likes')
    end

    def featured_post
        self.posts.order('likes DESC').first
    end
end
