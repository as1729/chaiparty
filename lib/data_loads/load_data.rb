require 'httparty'

module DataLoads
  class LoadData
    RAW_STATES_URL = 'https://gist.githubusercontent.com/mshafrir/2646763/raw/8b0dbb93521f5d6889502305335104218454c2bf/states_titlecase.json'

    def get_states(load=false)
      raw_response = HTTParty.get(RAW_STATES_URL)
      all_states = JSON.parse(raw_response.body)
      if load==true
        load_states(all_states)
      end
    end

    def get_districs
    end

    def get_moc
    end

    private
    def load_states(states)
      states.each do |state|
        State.create(name: state["name"], abbreviation: state["abbreviation"])
      end
    end

    def load_districs
    end

    def load_moc
    end
  end
end

