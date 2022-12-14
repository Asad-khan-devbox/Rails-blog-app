class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { minimum: 6, maximum: 1000 }
    validates :description, presence: true, length: { minimum: 6, maximum: 3000 }
end