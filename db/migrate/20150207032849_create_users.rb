class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gender, :default => "Male"
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
