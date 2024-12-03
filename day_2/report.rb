class Report
  MAX_DELTA = 3
  MIN_DELTA = 1
  
  def initialize(report_data)
    @levels = report_data.split.map(&:to_i)
  end

  def safe?(error_tolerance = 0)
    @levels.each_cons(2) do |current_value, next_value|
      error_tolerance -= 1 unless valid_delta?(current_value, next_value)
      return false if error_tolerance < 0
    end

    true
  end

  private

  def valid_delta?(current_value, next_value)
    delta = next_value - current_value
    step_direction = delta.abs == delta ? :positive : :negative
    @report_direction ||= step_direction

    return false if delta.abs < MIN_DELTA
    return false if delta.abs > MAX_DELTA
    @report_direction == step_direction
  end
end
