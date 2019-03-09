class ChangeTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :track_type, :string, null: false
  end
end
