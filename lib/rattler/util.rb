module Rattler

  module Util

    class << self #nodoc

      # Process file <src> and write RTL version to file <dest>
      # Accepts source and destination file paths.
      # Example: process_file('/path/to/file.css', '/path/to/file-rtl.css')
      def process_file(src, dest)
        puts 'Reading %s' % src
        css = File.open(src,'r'){ |f| f.read }
        rtl_css = Rattler::Converter.to_rtl css
        puts 'writing %s' % dest
        File.open(dest,'w'){ |f| f.write rtl_css }
      end

      # Process all files in directory, optionally filtered by extension <ext>
      # Accepts source and destination directories and an optional file extension string
      # Exmaple: process_directory('/tmp', '/tmp/rtl', 'less')
      def process_directory(src, dest, ext = nil)
        src_path = '%s/*.%s' % [File.expand_path(src), ext || '*']
        dest_path = File.expand_path dest
        Dir.glob(src_path) do |file|
          dest_file = File.join(dest_path,File.basename(file))
          process_file(file, dest_file)
        end
      end

      # Process file or directory, which can optionally be filtered by file extension
      # Accepts source and destination paths to file or directory to process and
      # an optional file extension string
      # Example:
      #  process_file_or_directory('/some/path', '/some/dest', 'less') # process only .less files directory
      #  process_file_or_directory('/some/file.css','/some/file-rtl.css')
      def process_file_or_directory(src, dest, ext = nil)

        raise 'Source not given' if src.nil? or not File.exists? src

        raise 'Destination not given' if dest.nil? or not File.exists? dest

        if File.directory? src
          process_directory(src, dest, ext)
        else
          process_file(src, dest)
        end
      end

    end #class << self

  end

end