class Post < ApplicationRecord
    belongs_to :destination
    belongs_to :blogger

    validates :title, {
        presence: true
    }
    validates :content, {
        presence:true,
        length: {minimum: 100}
    }
    

end
