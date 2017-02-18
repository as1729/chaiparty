class District < ActiveRecord::Base
  belongs_to :state
  def get_districts_by_state(state)
    return District.where(state: state)
  end
end
