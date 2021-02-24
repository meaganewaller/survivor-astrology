require './lib/sun_sign_calculator'

module HomeHelper
  def winner_by_sign
    SunSignCalculator::SUN_SIGNS.each do |sign|
      yield "#{sign[0]} - #{Contestant.where_sign_places(sign[0], 1).count}"
    end
  end
end
