require 'httparty'
#To load data you will be running the following via rails console.
#require './lib/data_loads/load_data.rb'
#Seems pretty dumb to put this under a data_loads module and then a LoadData class. Need to figure out why I did it this way.
#a = DataLoads::LoadData.new
#a.get_districts(true)
module DataLoads
  class LoadData
    RAW_STATES_URL = 'https://gist.githubusercontent.com/mshafrir/2646763/raw/8b0dbb93521f5d6889502305335104218454c2bf/states_titlecase.json'

    def get_states(load=false)
      raw_response = HTTParty.get(RAW_STATES_URL)
      all_states = JSON.parse(raw_response.body)
      if load
        load_states(all_states)
      end
    end

    def get_districts(load=false)
      #We are getting the data from the existing list of congressman so there is some bit of manipulation that needs to be done.
      #Connect to ProPublica to get Active House of Reps
      raw_results = ProPublica.new.get_all_members('house')
      data_hash = JSON.parse(raw_results.body)
      #Store raw data as a hash that looks like this {State_abbreviation: [Districts]}
      states_hash = {}
      data_hash["results"][0]["members"].each do |member|
        if states_hash.keys.include? member["state"].to_s
          states_hash[member["state"]] << member["district"]
        else
          states_hash[member["state"]] = [member["district"]]
        end
      end
      #Load data into database if needed.
      if load
        load_districts(states_hash)
      end
    end

    def get_moc
    end

    private
    def load_states(states)
      states.each do |state|
        State.create(name: state["name"], abbreviation: state["abbreviation"])
      end
    end

    def load_districts(states_hash)
      states_hash.each do |abbr, districts|
      state = State.find_by(abbreviation: abbr)
        districts.each do |name|
          District.create(name: name, state: state)
          puts "you are living in #{state}, #{name}"
        end
      end
    end

    def load_moc
    end
  end
end

