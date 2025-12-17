#!/usr/bin/env ruby

def match_id_part_one(id)
  id = id.to_s
  mid = id.size / 2
  id[0...mid] == id[mid..]
end

def match_id_part_two(id)
  id.to_s.match(/^(.+)\1+$/)
end

def match_id(id)
  match_id_part_two(id)
end

input = File.read('input')

ranges = input.split(',').map { |x| x.split('-') }.map { |x| (x[0].to_i..x[1].to_i) }

sum = ranges.sum do |range|
  range.sum do |id|
    if match_id(id) then id else 0 end
  end
end

puts sum

