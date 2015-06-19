require 'whenever/numeric_seconds'
require 'whenever/job_list'
require 'whenever/job'
require 'whenever/command_line'
require 'whenever/cron'
require 'whenever/output_redirection'

module Whenever
  def self.cron(options)
    Whenever::JobList.new(options).generate_cron_output
  end

  def self.seconds(number, units)
    Whenever::NumericSeconds.seconds(number, units)
  end

  def self.path(custom_path = nil)
    custom_path ? custom_path : Dir.pwd
  end

  def self.bin_rails?(custom_path = nil)
    File.exists?(File.join(path(custom_path), 'bin', 'rails'))
  end

  def self.script_rails?(custom_path = nil)
    File.exists?(File.join(path(custom_path), 'script', 'rails'))
  end

  def self.bundler?(custom_path = nil)
    File.exists?(File.join(path(custom_path), 'Gemfile'))
  end
end
