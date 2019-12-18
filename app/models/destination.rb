class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def last_5_posts
        self.posts.last(5)
    end

    def last_5_post_titles
        last_5_posts.map do |post|
            post.title 
        end
    end

    def most_liked_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def most_liked_post_title
        most_liked_post.title
    end
    
end
