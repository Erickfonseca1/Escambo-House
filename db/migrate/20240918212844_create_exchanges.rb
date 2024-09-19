class CreateExchanges < ActiveRecord::Migration[7.2]
  def change
    create_table :exchanges do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :service_offered, null: false, foreign_key: { to_table: :services }
      t.references :service_requested, null: false, foreign_key: { to_table: :services }
      t.string :status

      t.timestamps
    end
  end
end
