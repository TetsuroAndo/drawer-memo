class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.references :user, foreign_key: true
      t.references :emoji, foreign_key: true
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
