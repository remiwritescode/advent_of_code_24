class PrintRun
  attr_reader :pages, :unsorted_pages

  def initialize(unsorted_pages, sorted_pages)
    @unsorted_pages = unsorted_pages
    @pages = sorted_pages
  end

  def required_correction?
    @pages != @unsorted_pages
  end

  def middle_page
    return nil unless @pages.length.odd?
    @pages[@pages.length / 2]
  end

  def self.correct(unsorted_pages, rules)
    sorted_pages = self.sort_pages(unsorted_pages, rules)
    return new(unsorted_pages, sorted_pages)
  end

  private

  def self.sort_pages(unsorted_pages, unfiltered_rules)
    return unsorted_pages if unsorted_pages.length == 1
    
    filtered_rules = filter_applicable_rules(unsorted_pages, unfiltered_rules)
    rules_by_second_page = filtered_rules.each_with_object(Hash.new([])) do |rule, memo|
      memo[rule[1]] += rule
    end

    first_pages = unsorted_pages.select { |page| !rules_by_second_page.keys.include?(page) }
    if first_pages.empty?
      return nil
    end

    remaining_pages = unsorted_pages - first_pages
    sorted_remaining_pages = sort_pages(remaining_pages, filtered_rules)
    if sorted_remaining_pages.nil?
      require 'pry'; binding.pry
    end

    return first_pages + sorted_remaining_pages
  end

  def self.filter_applicable_rules(pages, rules)
    rules.select do |(first_page, second_page)|
      pages.include?(first_page) && pages.include?(second_page)
    end
  end
end
