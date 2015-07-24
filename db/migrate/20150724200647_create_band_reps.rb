class CreateBandReps < ActiveRecord::Migration
  def change
    create_table :band_reps do |t|
      t.string :username
      t.string :password_digest
      t.references :band, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
