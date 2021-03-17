class AddIndexToInvites < ActiveRecord::Migration[6.0]
  def change
    add_index :invites, :invitee_id
    add_index :invites, :event_id
    add_index :invites, [:invitee_id, :even_id], unique: true
  end
end
