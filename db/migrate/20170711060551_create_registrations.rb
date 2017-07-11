class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string :status, :default => "pending"
      t.string :uuid
      t.integer :event_id, :index => true
      t.integer :ticket_id, :index => true
      t.integer :department_id, :index => true
      t.integer :job_id, :index => true
      t.integer :user_id, :index => true
      t.string :name
      t.string :email
      t.string :cellphone


      t.timestamps
    end

    add_index :registrations, :uuid,  :unique => true
  end
end
