require 'pry'

file = File.read('./db/contestants.json')
data_hash = JSON.parse(file)

data_hash.each_with_index do |season_hash, index|
  season = season_hash[0]
  season_record = Season.find_or_create_by(name: season, season_number: index + 1)
  contestants = season_hash[1]["contestants"]
  contestants.reverse.each_with_index do |contestant, index|
    contestant_record = Contestant.find_or_create_by(name: contestant[0], birthday: contestant[1].split[0..1].join(" ").delete(","))
    season_contestant = SeasonContestant.find_or_create_by(season: season_record, contestant: contestant_record)
    season_contestant.update(place: index + 1)
  end

end
