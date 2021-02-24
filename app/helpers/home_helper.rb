require './lib/sun_sign_calculator'

module HomeHelper
  def winner_by_sign
    SunSignCalculator::SUN_SIGNS.each do |sign|
      yield "#{sign[0]} - #{Contestant.where_sign_places(sign[0], 1).count}"
    end
  end

  def by_sign
    SunSignCalculator::SUN_SIGNS.each do |sign|
      yield "#{sign[0]} - #{Contestant.where(sun_sign: sign[0]).count}"
    end
  end

  def percent_win
    SunSignCalculator::SUN_SIGNS.each do |sign|
      yield "#{sign[0]}: #{percentage(sign[0])}"
    end
  end

  def percentage(sign)
    Contestant.where_sign_places(sign, 1).count.to_f / Contestant.where(sun_sign: sign).count.to_f
  end
end
