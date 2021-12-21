class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.integer :iteration
      t.integer :factorial
      t.integer :number

      t.timestamps
    end
  end
end
