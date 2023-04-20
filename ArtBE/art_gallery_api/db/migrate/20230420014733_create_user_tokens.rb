class CreateUserTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tokens do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
    add_index :user_tokens, :token
  end
end
