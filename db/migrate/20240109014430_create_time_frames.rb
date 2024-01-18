class CreateTimeFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :time_frames do |t|
      t.string :name
      t.string :time_code
      t.string :description

      t.timestamps
    end
  end
end
