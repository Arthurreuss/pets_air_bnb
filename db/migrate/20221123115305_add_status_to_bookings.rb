class AddStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :status, :boolean
    remove_column :pets, :status, :boolean
  end
end
