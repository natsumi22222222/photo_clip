class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id,   null: false
      t.integer :genre_id,   null: false
      t.string :title,    null: false
      t.text :body,    null: false
      t.float :lat,        null: false
      t.float :lng,        null: false
      t.string :camera_maker
      t.string :camera_model
      t.string :lens
      t.datetime :shooting_time
      t.string :image_size
      t.string :iso_speed
      t.string :focal_length
      t.float :exposure
      t.float :shutter_speed
      t.string :aperture
      t.string :software
      t.string :extension

      t.timestamps
    end
  end
end
