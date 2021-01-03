class AddAccountIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :account, type: :uuid, foreign_key: true, index: true
  end
end
