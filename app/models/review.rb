class Review < ActiveRecord::Base
    validates :rating, presence: true
    validates_inclusion_of :rating, :in => [1, 2, 3, 4, 5]
    validates :body, presence: true
    belongs_to :restaurant
end
