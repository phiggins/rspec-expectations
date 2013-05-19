module RSpec
  unless respond_to?(:deprecate)
    # @private
    #
    # Used internally by RSpec to display standard deprecation warnings.
    # This is also defined in rspec-core, but we can't assume it's loaded
    # since rspec-expectations should be usable w/o rspec-core.
    def self.deprecate(method, alternate_method=nil, version=nil)
      lines = ["#{method} is deprecated"]
      if version
        lines.last << ", and will be removed from rspec-#{version}"
      end
      if alternate_method
        lines << "use #{alternate_method} instead"
      end

      lines << "called from #{caller(0)[2]}"

      warn_deprecation "\n" + lines.map {|l| "DEPRECATION: #{l}"}.join("\n") + "\n"
    end
  end

  unless respond_to?(:warn_deprecation)
    # @private
    #
    # Used internally by RSpec to display custom deprecation warnings.  This
    # is also defined in rspec-core, but we can't assume it's loaded since
    # rspec-expectations should be usable w/o rspec-core.
    def warn_deprecation(message)
      warn(message)
    end
  end
end
