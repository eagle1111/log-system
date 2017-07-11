class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :event_id, :index => true
      t.string :name
      t.text :description
      
      t.timestamps
    end
  end
end
