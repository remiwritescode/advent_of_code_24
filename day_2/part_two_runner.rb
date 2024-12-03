require_relative 'report_validator'

reports_data = File.read('input.txt')
p ReportValidator.new(reports_data).safe_count(1)
