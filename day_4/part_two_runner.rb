require_relative 'word_search'

input = File.read('input.txt')

p WordSearch.new(input).xmas_count

