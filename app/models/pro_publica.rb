class ProPublica
  include HTTParty
  base_uri 'https://api.propublica.org/congress/v1'
  headers "X-API-Key" => ENV["PRO_PUBLICA_API_KEY"]
  def initialize
    @congress = 115
  end

  #Below are methods that will get you data about Members of Congress.
  def get_all_members(chamber)
    self.class.get("/#{@congress}/#{chamber}/members.json")
  end

  def get_member_by_id(member_id)
    self.class.get("/members/#{member_id}.json")
  end

  def get_new_members
    self.class.get("/members/new.json")
  end

  #This will return multiple members as each state has two representatives at a minimum.
  def get_members_by_state(state, chamber)
    self.class.get("/members/#{chamber}/#{state}/current.json")
  end

  #This could return multiple members depending on the inputs.
  def get_members_by_district(state, chamber, district)
    self.class.get("/members/#{chamber}/#{state}/#{district}/current.json")
  end

  def get_members_leaving_office(congress, chamber)
    self.class.get("#{congress}/#{chamber}/members/leaving.json")
  end

  def get_member_recent_vote_positions(member_id)
    self.class.get("/members/#{member_id}/votes.json")
  end

  #Below are methods that will get you data about Votes on Bills


  #Below are methods that will get you data about Bills

  #Below are methods that will get you data about Nominations

  #State Party Counts

  #Committees and Comittee Memberships
end