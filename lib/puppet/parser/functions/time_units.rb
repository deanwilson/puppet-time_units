module Puppet::Parser::Functions
  newfunction(:time_units, type: :rvalue, :doc => <<-EOD
    A Puppet function that converts between different units of time.

      A basic conversion is called like this:
      time_units(15, 'minutes', 'seconds') # returns 900

      You can also make calls using a slightly 'prettier' 4 argument version
      time_units(2, 'hours', 'in', 'minutes') # returns 120
  EOD
  ) do |args|
    unless args.length == 3 || args.length == 4
      fail ArgumentError, "time_units(): wrong number of arguments (#{args.length} must be 3 or 4)"
    end

    amount    = args[0]
    from_unit = args[1].chomp('s')   # remove 's' from the end to normalise the input
    to_unit   = args[-1].chomp('s')  # so 3 days and 1 day both work

    case from_unit
    when 'minute'
      case to_unit
      when 'second' then amount * 60
      else fail ArgumentError, "time_units(): don't know how to convert to #{to_unit}"
      end

    when 'hour'
      case to_unit
      when 'minute' then amount * 60
      when 'second' then amount * 60 * 60
      else fail ArgumentError, "time_units(): don't know how to convert to #{to_unit}"
      end

    when 'day'
      case to_unit
      when 'hour'   then amount * 24
      when 'minute' then amount * 24 * 60
      when 'second' then amount * 24 * 60 * 60
      else fail ArgumentError, "time_units(): don't know how to convert to #{to_unit}"
      end

    when 'week'
      case to_unit
      when 'day'    then amount * 7
      when 'hour'   then amount * 7 * 24
      when 'minute' then amount * 7 * 24 * 60
      when 'second' then amount * 7 * 24 * 60 * 60
      else fail ArgumentError, "time_units(): don't know how to convert to #{to_unit}"
      end

    else fail ArgumentError, "time_units(): don't know how to convert from #{from_unit}"
    end
  end
end
