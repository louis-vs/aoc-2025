#!/usr/bin/env ruby

rotations = File.readlines('input')

$dial = 50

$real_code = 0

def apply_dial(size)
  factor = size <=> 0
  size.abs.times do
    $dial += 1 * factor

    $dial -= 100 while $dial >= 100

    $dial += 100 while $dial < 0

    $real_code += 1 if $dial == 0
  end
end

rotations.each do |rotation|
  dir = rotation[0]
  size = rotation[1..].to_i
  if dir == 'R'
    apply_dial(size)
  else
    apply_dial(-size)
  end
end

puts $real_code
