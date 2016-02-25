# It's super convenient to type 10.hours or t.to_s(:db), we want to be
# able to use these things freely in our PORO code.
require 'active_support/core_ext'

# Unless you have concerns about making inter-class dependencies
# explicit, there's really no good reason to add requires all over the
# place.
require 'active_support/dependencies'

# Yes, this is a bit of duplication you have to manage between here and
# your application config, but I think it's worth it.
%w( lib app/models ).each do |dir|
  $LOAD_PATH << dir
  ActiveSupport::Dependencies.autoload_paths << dir
end

# Without fail, a PORO is going to reference an AR-based class. Your
# PORO spec can (and should) stub all the behavior of that class, but
# simply loading it will reference this constant.
module ActiveRecord
  class Base
    # You should also make no-ops for any class-level macros you use.
    # Again, we should be stubbing as needed, this just allows the class
    # definition to be sourced without error.
    class << self
      def belongs_to(*); end
      def has_many(*)  ; end
      # ...
    end
  end
end
