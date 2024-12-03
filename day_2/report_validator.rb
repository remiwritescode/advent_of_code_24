require_relative 'report'

class ReportValidator
  attr_reader :raw_data

  def initialize(reports_data)
    @raw_data = reports_data
  end

  def safe_count
    reports.count { |report| report.safe? }
  end

  def reports
    @reports ||= raw_data.split("\n").map { |report_data| Report.new(report_data) }
  end
end
