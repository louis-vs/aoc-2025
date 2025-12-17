#!/usr/bin/env ruby

def read_banks
  File.readlines('input').map { |raw_bank| raw_bank.chomp.chars.map(&:to_i) }
end

def get_joltage(banks, k)
  banks.sum do |bank|
    # max between indexOfLast+1 and size-digitsRemaining (inclusive)
    index_of_last = 0
    k.downto(1).map do |digits_remaining|
      splice = bank[index_of_last..bank.size - digits_remaining]
      max = splice.max

      index_of_last += splice.index(max) + 1

      max
    end.join('').to_i
  end
end

puts "Part 1: #{get_joltage(read_banks, 2)}"

puts "Part 2: #{get_joltage(read_banks, 12)}"
