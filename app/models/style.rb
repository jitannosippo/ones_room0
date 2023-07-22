class Style < ApplicationRecord
    has_many :items, dependent: :destroy
end
