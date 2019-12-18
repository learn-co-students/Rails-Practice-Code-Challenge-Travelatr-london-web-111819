class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

   def featured_post
    self.posts.max_by(&:likes) #Destination.first.posts.max_by(&:likes) in console returns
   end #andswer for a single instance

  def five_recent_posts
    self.posts.sort_by(&:created_at).reverse.take(5)
  end 

    
    def average_age 
      if self.bloggers.length > 0
      self.bloggers.sum("age").to_f / self.bloggers.length
      else
        0
      end
    end
end
