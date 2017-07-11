class AddDescriptionToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_column :registrations, :description, :text
  end
end
