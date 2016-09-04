class Twot < ApplicationRecord
    validates :body, presence: true
    validates :body, format: { with: /\A[a-zA-Z0-9]+\Z/, message: 'can\'t contain white spaces'}
end
