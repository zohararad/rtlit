module RTLit #nodoc

  # Files and directories utilities for converting
  # CSS-formatted files to RTL
  module Util

    class << self

      # Converts CSS-formatted file to RTL.
      #
      # Accepts source and destination file paths.
      #
      # @param [String] src the source file to convert
      # @param [String] dest the destination file to write converted CSS to
      #
      # Example:
      #     process_file('/path/to/file.css', '/path/to/file-rtl.css')
      #
      def process_file(src, dest)
        puts 'Reading %s' % src
        css = File.open(src,'r'){ |f| f.read }
        rtl_css = RTLit::Converter.to_rtl css
        puts 'writing %s' % dest
        File.open(dest,'w'){ |f| f.write rtl_css }
      end

      # Converts CSS-formatted files in a directory, optionally filtered by extension, to RTL.
      #
      # Accepts source and destination directories and an optional file extension string
      #
      # @param [String] src the source directory to convert
      # @param [String] dest the destination directory to write converted CSS files to
      # @param [String] ext optional file extension to filter source files by
      #
      # Exmaple:
      #     process_directory('/tmp', '/tmp/rtl', 'less')
      #
      def process_directory(src, dest, ext = nil)
        src_path = '%s/*.%s' % [File.expand_path(src), ext || '*']
        dest_path = File.expand_path dest
        Dir.glob(src_path) do |file|
          dest_file = File.join(dest_path,File.basename(file))
          process_file(file, dest_file)
        end
      end

      # Convert CSS-formatted file or directory containing such files, which can optionally be filtered by file extension.
      #
      # Accepts source and destination paths to file or directory to convert and
      # an optional file extension string to filter by (in case source path is a directory)
      #
      # @param [String] src the source directory to convert
      # @param [String] dest the destination directory to write converted CSS files to
      # @param [String] ext optional file extension to filter source files by
      #
      # Example:
      #     process_file_or_directory('/some/path', '/some/dest', 'less') # process only .less files directory
      #     process_file_or_directory('/some/file.css','/some/file-rtl.css')
      #
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