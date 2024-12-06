require_relative 'print_run'

input = File.read('input.txt')

rule_inputs, print_job_inputs = input.split("\n\n")

rules = rule_inputs.split("\n").map { |rule_input| rule_input.split('|').map(&:to_i) }

print_jobs = print_job_inputs.split("\n").map do |print_job_input|
  pages = print_job_input.split(",").map(&:to_i)
  PrintRun.correct(pages, rules)
end

total = 0
print_jobs.each do |print_job|
  total += print_job.required_correction? ? print_job.middle_page : 0
end

puts total
