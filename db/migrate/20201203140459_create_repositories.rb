class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.integer :stars
      t.string :description
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
