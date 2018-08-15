class Review < ApplicationRecord
  belongs_to :restaurant do
    resources :reviews, only: [ :new, :create ]
  end
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }
end
