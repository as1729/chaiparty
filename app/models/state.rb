class State < ActiveRecord::Base
  has_many :districts
  def show
    @state = State.find(params[:id])
  end
end
