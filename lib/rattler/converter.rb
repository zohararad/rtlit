module Rattler

  module Converter

    class << self #nodoc

      # Convert CSS properties and values from LTR to RTL.
      #
      # Accepts any valid CSS string.
      # Returns a CSS string.
      #
      # Example:
      #
      # css = "
      #  body {
      #    text-align: left;
      #    padding-right: 10px;
      #  }"
      #
      #  to_rtl(css)
      #
      def to_rtl(css)
        place_holder = '|====|'
        css.gsub! 'ltr', 'rtl'

        ltr_matches = css.scan /^([\n\s]*[^:\n\t\s\.\#\{\}]*(left|right)[^:]*:)|(:[^\w\.\#\{\}]*[^;\.\#\{\}]*(left|right)[^;]*;)/
        css_to_replace = ltr_matches.flatten.delete_if{|a| a.nil? || ['left','right'].include?(a) }
        css_to_replace.each do |match|
          next if match.include? 'right' or match =~ /(left|right)\s(top|bottom|\d+[\w%]+)/
          css.gsub! match, (match.gsub 'left', place_holder)
        end
        css_to_replace.each do |match|
          next if match.include? 'left' or match =~ /(left|right)\s(top|bottom|\d+[\w%]+)/
          css.gsub! match, (match.gsub 'right', 'left')
        end
        css.gsub! place_holder, 'right'

        quad_matches = css.scan /\d+[\w%]+\s\d+[\w%]+\s\d+[\w%]+\s\d+[\w%]+/
        quad_matches.each do |m|
          t, r, b, l = m.split ' '
          css.gsub! m, [t,l,b,r].join(' ')
        end
        return css
      end #to_rtl

    end # class << self

  end

end