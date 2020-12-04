class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.integer :stargazers_count
      t.string :description
      t.string :html_url
      t.string :name
      t.integer :remote_id
      t.datetime :remote_updated_at

      t.timestamps
    end
  end
end
