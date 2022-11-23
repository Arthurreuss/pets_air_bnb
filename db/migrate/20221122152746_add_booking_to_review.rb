class AddBookingToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :booking, null: false, foreign_key: true
    remove_reference :reviews, :pet, null: false, foreign_key: true
  end
end
