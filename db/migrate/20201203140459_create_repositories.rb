class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.integer :stars, default: 0, null: false
      t.string :description, default: "no description added", null: false
      t.string :url, default: "#", null: false
      t.string :name, default: "Repository name", null: false

      t.timestamps
    end
  end
end
