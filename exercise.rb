require 'awesome_print'

ballots = [
  { 1 => 'Smudge', 2 => 'Tigger', 3 => 'Simba' },
  { 1 => 'Bella', 2 => 'Lucky', 3 => 'Tigger' },
  { 1 => 'Bella', 2 => 'Boots', 3 => 'Smudge' },
  { 1 => 'Boots', 2 => 'Felix', 3 => 'Bella' },
  { 1 => 'Lucky', 2 => 'Felix', 3 => 'Bella' },
  { 1 => 'Smudge', 2 => 'Simba', 3 => 'Felix' }
]

# Approach here will be to assume the above array is of arbitrary length

candidates = {}

ballots.each do |ballot|
  ballot.each do |_number, candidate_name|
    unless candidates.include?([candidate_name, 0])
      candidates[candidate_name] = 0
    end
  end
end

puts "The candidates are:"
ap candidates.keys

voted_candidates = candidates.each do |name, score|
  ballots.each do |ballot|
    if name == ballot[1]
      score += 3
    elsif name == ballot[2]
      score += 2
    elsif name == ballot[3]
      score += 1
    end
    candidates[name] = score
  end
end

puts "The votes are in!"
ap voted_candidates

winner = voted_candidates.key(voted_candidates.values.max)
winner_votes = voted_candidates.values.max
puts "And the winner of the general election, with #{winner_votes} votes, is: #{winner}!!!"
