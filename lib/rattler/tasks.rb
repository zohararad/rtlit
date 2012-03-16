require 'rake'
require 'rattler'

namespace :css do

  desc 'convert CSS file or files in directory from LTR to RTL'
  task :to_rtl, [:src, :dest, :ext] do |t, args|
    Rattler::Util.process_file_or_directory(args[:src], args[:dest], args[:ext])
  end

end