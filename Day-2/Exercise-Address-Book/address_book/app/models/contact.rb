class Contact < ApplicationRecord
    validates :name, :address, presence: true
end
