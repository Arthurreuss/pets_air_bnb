class AddReviewToPet < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :pet, null: false, foreign_key: true
  end
end
