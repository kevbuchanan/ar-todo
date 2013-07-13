class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :tasks_tags do |t|
      t.references :task 
      t.references :tag 
      t.timestamps
    end
  end
end