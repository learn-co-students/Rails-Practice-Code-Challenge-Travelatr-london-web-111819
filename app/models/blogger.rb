class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, {
        presence: true,
        uniqueness: true
    }
    validates :age, {
        presence:true,
        numericality: {greater_than: 0 }
    }
    validates :bio, {
        presence: true,
        length: {minimum: 30}
    }

    def total_likes
        self.posts.sum("likes")
    end

    def featured_post
        self.posts.max_by(&:likes)
    end #to test things in console, type Blogger.first.posts.max_by(&:likes)
    #as we are working with just one instance

    def 5_most_written_about_destinations
        array = self.posts.map{|post| post.destination_id} #produces an array of destination instances
        top_occurence = array.uniq.max_by{ |i| arr.count( i ) } #finds the most occuring element in the array
        Destination.find(:id == top_occurence) #finds instance where id is equal to most occured
    end

    
    

end
