class Job < ApplicationRecord
  belongs_to :user
  has_many :offers
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_all,
  against: [ :name, :description, :address, :price ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
