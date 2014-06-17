class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name

      t.timestamps
    end
    add_index :questions, [:package_id]
  end
end
