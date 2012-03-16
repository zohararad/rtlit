require 'rattler'

namespace :rattler do

  desc 'convert CSS file or files in directory from LTR to RTL'
  task :convert, [:src, :dest, :ext] do |t, args|
    Rattler::Util.process_file_or_directory(args[:src], args[:dest], args[:ext])
  end

end