class AddStateRefToDistricts < ActiveRecord::Migration
  def change
    add_reference :districts, :state, index: true, foreign_key: true
  end
end
