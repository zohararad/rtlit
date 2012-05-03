module RTLit #nodoc

  # CSS string LTR to RTL converter
  #
  module Converter

    class << self

      # Convert CSS properties and values from LTR to RTL.
      # Accepts any valid CSS string.
      # Returns a CSS string.
      #
      # @param [String] css the css string to convert to RTL
      # @return [String] the RTL version of the css
      #
      # Example:
      #
      #     css = "
      #       body {
      #         text-align: left;
      #         padding-right: 10px;
      #       }"
      #
      #     rtl_css = to_rtl(css)
      #
      def to_rtl(css) ''
        place_holder = '|====|'
        converted_css = css.gsub 'ltr', 'rtl'

        ltr_matches = converted_css.scan /^([\n\s]*[^:\n\t\s\.\#\{\}]*(left|right)[^:]*:)|(:[^\w\.\#\{\}]*[^;\.\#\{\}]*(left|right)[^;]*;)/
        css_to_replace = ltr_matches.flatten.delete_if{|a| a.nil? || ['left','right'].include?(a) }
        css_to_replace.each do |match|
          next if match.include? 'right' or match =~ /(left|right)\s(top|bottom|\d+[\w%]+)/
          converted_css.gsub! match, (match.gsub 'left', place_holder)
        end
        css_to_replace.each do |match|
          next if match.include? 'left' or match =~ /(left|right)\s(top|bottom|\d+[\w%]+)/
          converted_css.gsub! match, (match.gsub 'right', 'left')
        end
        converted_css.gsub! place_holder, 'right'

        quad_matches = converted_css.scan /(-?\d+(?:px|pt|em|%)+|@\w+)\s+(-?\d+(?:px|pt|em|%)+|@\w+)\s+(-?\d+(?:px|pt|em|%)+|@\w+)\s+(-?\d+(?:px|pt|em|%)+|@\w+)/
        #quad_matches = converted_css.scan /[\-\d\w\@\%]+\s+[\-\d\w\@\%]+\s+[\-\d\w\@\%]+\s+[\-\d\w\@\%]+/
        quad_matches.each do |ar|
          m = ar.join(' ')
          t, r, b, l = m.split ' '
          converted_css.gsub! m, [t,l,b,r].join(' ')
        end
        return converted_css
      end #to_rtl

    end # class << self

  end

end