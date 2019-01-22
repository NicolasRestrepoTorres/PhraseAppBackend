class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.string :language, null: false, default: "en"
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
