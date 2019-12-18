
class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_N_posts(n)
        # a = self.posts.max_by(n){|p|p.created_at}.sort_by{|p| p.created_at}.reverse
        a = self.posts.sort_by(&:created_at).reverse.take(n)
        if a.count == 0 
            return nil
        end
        a
    end

    def most_liked_N_posts(n)
        # a = self.posts.max_by(n){|p|p.likes}
        self.posts.max_by(&:likes)
        # self.posts.max_by(&:likes)
    end

    def average_age_of_all_bloggers_posted_on
        a = self.posts.each{|p|p.blogger}.uniq.map{|post|post.blogger.age}
        if a.count == 0 
            return nil
        end
        a.sum.to_f/a.count
    end

end
