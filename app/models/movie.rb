class Movie < ActiveRecord::Base
    has_many :reviews
    belongs_to :actor 
    belongs_to :user
end