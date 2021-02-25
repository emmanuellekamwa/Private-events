class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :location
      t.date :date

      t.timestamps
    end
  end
end
