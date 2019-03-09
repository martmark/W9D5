class Track < ApplicationRecord
  TYPES = ["regular", "bonus"]
  validates :title, :album_id, :ord, :track_type, presence: true
  validates :track_type, inclusion: TYPES

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

end
