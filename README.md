# Rattler

CSS left-to-right to right-to-left converter.

Takes CSS, LESS, SASS files and converts them from a left-to-right orientation to a right-to-left orientation. Useful when trying to convert English / Latin / LTR based stylesheets to support RTL languages like Hebrew / Arabic.

## Installation

Add this line to your application's Gemfile:

    gem 'rattler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rattler

## Usage

You can use Rattler in one of three ways

### In your code

Include Rattler in your application and convert any CSS string to RTL

    require 'rattler'

    ltr_css = File.open('/path/to/ltr/file.css','r') { |f| f.read }
    rtl_css = Rattler::Converter.to_rtl ltr_css

### As a Rake task

Convert a single file with Rattler

    rake rattler:convert[/path/to/src.css,/path/to/dest.css]

Convert a directory with Rattler

    rake rattler:convert[/path/to/src/,/path/to/dest/]

Convert files in a directory filtered by extension

    rake rattler:convert[/path/to/src/,/path/to/dest/, less] # will convert only *.less files in /path/to/src/

### As a CLI command

    $ rattler /path/to/src/file.css /path/to/dest/file-rtl.css # will convert /path/to/src/file.css and output to /path/to/dest/file-rtl.css

    $ rattler /path/to/src /path/to/dest # will convert all files in /path/to/src/ and output to /path/to/dest

    $ rattler -x less /path/to/src /path/to/dest # will convert only *.less files in /path/to/src/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
