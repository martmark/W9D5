class Album < ApplicationRecord
  TYPES = ["studio", "live"].freeze

  validates :band_id, :title, :year, :album_type, presence: true
  validates :album_type, inclusion: TYPES

  belongs_to :band

  has_many :tracks


end
