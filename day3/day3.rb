#!/usr/bin/env ruby

def banks
  File.readlines('input').map { |raw_bank| raw_bank.chomp.chars.map(&:to_i) }
end

def part_one
  banks.sum do |bank|
    max = bank.max
    max_index = bank.index(max)

    if max_index == bank.size - 1
      # edge case - last is biggest
      max = bank[0..-2].max
      second_max = bank.last
    else
      second_max = bank[max_index + 1..].max
    end

    "#{max}#{second_max}".to_i
  end
end

def part_two
  banks.sum do |bank|
    # max between indexOfLast+1 and size-digitsRemaining (inclusive)
    index_of_last = 0
    12.downto(1).map do |digits_remaining|
      splice = bank[index_of_last..bank.size - digits_remaining]
      max = splice.max

      index_of_last += splice.index(max) + 1

      max
    end.join('').to_i
  end
end

puts part_two
