class BenchmarkLogger < Logger
  def format_message(_severity, _timestamp, _progname, msg)
    "#{msg}\n"
  end
end

logfile = File.open("#{Rails.root}/log/benchmark.log", 'a') # create log file
logfile.sync = true # automatically flushes data to file
BENCHMARKLOGGER = BenchmarkLogger.new(logfile) # constant accessible anywhere
