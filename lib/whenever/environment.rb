module Whenever
  class Environment
    
    def initialize(environment_string = nil)
      @options = {}
      
      return if environment_string.nil? || environment_string == ""

      pairs = environment_string.split('&')
      pairs.each do |pair|
        next unless pair.index('=')
        variable, value = *pair.split('=')
        unless variable.nil? || variable == "" || value.nil? || value == ""
          @options[variable] = value
        end
      end
    end

    def [](idx)
      @options[idx]
    end

    def each(&block)
      @options.each(&block)
    end

  end
end
