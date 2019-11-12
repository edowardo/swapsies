class Listing < ApplicationRecord
  CONDITIONS = ['new', 'like new', 'good', 'acceptable']
  belongs_to :user
  belongs_to :game
  validates :user, :game, :condition, presence: true
  validates :condition, inclusion: {
    in: CONDITIONS,
    message: "Not a valid condition"
  }
  # has_many :swaps_where_offered, inverse_of: :listing_offered
  # has_many :swaps_where_requested, source: :swaps, foreign_key: :listing_requested

  # has_many :swaps, ->(listing) { unscope(:where).where("listing_requested_id = :id OR listing_offered_id = :id", id: listing.id) }

  has_many :requested_swaps, foreign_key: 'listing_requested', class_name: 'Swap'
  has_many :offered_swaps, foreign_key: 'listing_offered', class_name: 'Swap'
end
