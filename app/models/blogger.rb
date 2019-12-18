class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, format: { with: /[1-9][0-9]*/ }
    validates :bio, length: { minimum: 30 }

    def total_likes
        arr = []
        self.posts.each do |post|
            arr << post.likes
        end
        total = arr.reduce(:+)
        p total
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
