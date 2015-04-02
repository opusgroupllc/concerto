class AddReferralToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :referral, :string
  end
end
