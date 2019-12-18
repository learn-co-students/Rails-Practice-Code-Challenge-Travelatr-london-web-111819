class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, {presence: true,uniqueness: true}
    validates :bio, length: { minimum: 30 }
    validates :age, numericality: { greater_than: 0 }

    def total_likes
        # Post.all.select{|blog|blog.blogger_id==self.id}.map{|blog|blog.likes}.reduce{|sum,num|sum+=num}
        # Post.all.select{|blog|blog.blogger_id==self.id}.sum(&:likes)
        self.posts.sum("likes")
    end

    def featured_post
        self.posts.max_by(&:likes)
    end

    def top_5_most_written_destinations
        self.posts.group_by("destination_id")
    end
    
end
