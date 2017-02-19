class District < ActiveRecord::Base
  belongs_to :state
  validates :name, uniqueness: {scope: :state, message: "should be only one district state combination"}
  def get_districts_by_state(state)
    return District.where(state: state)
  end
end
