require './lib/sun_sign_calculator'
class Contestant < ApplicationRecord
  has_many :season_contestants
  has_many :seasons, through: :season_contestants

  after_create :get_sun_sign

  # Contestant scope
  def self.where_sign_places(sun_sign, place)
    joins(:season_contestants).where(sun_sign: sun_sign, season_contestants: { place: place} )
  end

  def get_sun_sign
    puts "Getting sun sign for #{name}"
    unless birthday.empty?
      if birthday == "February 29"
        # Leap year makes date parsing crash when you're parsing outside of a leap year.
        @birthday = Date.parse("February 28")
      else
        @birthday = Date.parse(birthday)
      end
      sun_sign = SunSignCalculator.calculate(@birthday)
      update(sun_sign: sun_sign)
    end
  end
end
