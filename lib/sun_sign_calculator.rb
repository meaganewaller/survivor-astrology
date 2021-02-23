require 'date'
ARIES       = "Aries"
TAURUS      = "Taurus"
GEMINI      = "Gemini"
CANCER      = "Cancer"
LEO         = "Leo"
VIRGO       = "Virgo"
LIBRA       = "Libra"
SCORPIO     = "Scorpio"
SAGITTARIUS = "Sagittarius"
CAPRICORN   = "Capricorn"
AQUARIUS    = "Aquarius"
PISCES      = "Pisces"

SUN_SIGNS = {
  ARIES       => ['March 21', 'April 20'],
  TAURUS      => ['April 21', 'May 21'],
  GEMINI      => ['May 22', 'June 21'],
  CANCER      => ['June 22', 'July 22'],
  LEO         => ['July 23', 'August 21'],
  VIRGO       => ['August 22', 'September 23'],
  LIBRA       => ['September 24', 'October 23'],
  SCORPIO     => ['October 24', 'November 22'],
  SAGITTARIUS => ['November 23', 'December 22'],
  CAPRICORN   => [['December 23', 'December 31'],
                  ['January 1', 'January 20']],
  AQUARIUS    => ['January 21', 'Feburary 19'],
  PISCES      => ['Feburary 20', 'March 20']
}
class SunSignCalculator
  def self.calculate(date)
    SUN_SIGNS.each do |sign, dates|
      if sign == CAPRICORN
        if date.between?(Date.parse(dates[0][0]), Date.parse(dates[0][1])) ||
            date.between?(Date.parse(dates[1][0]), Date.parse(dates[1][1]))
          return sign
        end
      else
        if date.between?(Date.parse(dates[0]), Date.parse(dates[1]))
          return sign
        end
      end
    end
  end
end
