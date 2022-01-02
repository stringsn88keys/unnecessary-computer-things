# Welcome to Sonic Pi

my_tempo=140.0
stretch_factor = my_tempo/(16*60/(sample_duration :loop_amen_full))
new_length = stretch_factor * (sample_duration :loop_amen_full)

set :continueplay, 1
use_bpm my_tempo

in_thread do
  loop do
    print "loop"
    sample :loop_amen_full, rate: stretch_factor
    sleep 16 # new_length
    cue :the_beat
    stop if get(:continueplay) == 0
  end
end

def play_length note, length
  play note, release: length
  sleep length
end

def straight_quarters notes
  notes.each do |note|
    play_length note, 1
  end
end

def end_cap_full notes
  play_length notes[0], 1
  play_length notes[1], 3
end

def end_cap_half notes
  play_length notes[0], 1
  play_length notes[1], 2
  sleep 1
end

# because the chorus aligns on downbeats, mostly
def aligned_half_quarters notes
  play_length notes[0], 2
  play_length notes[1], 1
  play_length notes[2], 1
end

def aligned_half_w_eighths notes
  play_length notes[0], 2
  play_length notes[1], 0.5
  play_length notes[2], 0.5
  play_length notes[3], 1
end

def aligned_quarters notes
  notes.each do |note|
    play_length note, 1
  end
end

def soprano
  # melody
  in_thread do
    note_arrays=[
      [:e4, :e4, :b4, :b4],
      [:a4, :g4, :fs4, :e4],
      [:d4, :e4, :fs4, :g4]
    ]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_full [:a4, :b4]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_half [:a4, :b4]
    
    note_arrays=[
      [:b4, :c5, :a4, :b4],
      [:c5, :d5, :e5, :b4],
      [:a4, :g4, :e4, :fs4],
    ]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    
    play_length :g4, 1
    aligned_half_quarters [:a4, :g4, :a4]
    aligned_half_quarters [:b4, :c5, :b4]
    aligned_quarters [:b4, :a4, :g4, :fs4]
    aligned_half_w_eighths [:e4, :g4, :fs4, :e4]
    aligned_half_quarters [:a4, :g4, :a4]
    aligned_quarters [:b4, :c5, :d5, :e5]
    aligned_quarters [:b4, :a4, :g4, :fs4]
    play_length :e4, 3
    cue :melody
  end
end

def alto
  # alto
  in_thread do
    note_arrays=[
      [:e4, :e4, :g4, :fs4],
      [:ds4, :e4, :d4, :c4],
      [:b3, :e4, :ds4, :e4]
    ]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_full [:e4, :ds4]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_half [:e4, :ds4]
    
    note_arrays=[
      [:e4, :e4, :d4, :d4],
      [:g4, :f4, :e4, :d4],
      [:ds4, :e4, :cs4, :d4],
    ]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    
    play_length :g4, 1
    aligned_half_quarters [:fs4, :g4, :d4]
    aligned_half_quarters [:d4, :e4, :d4]
    aligned_quarters [:g4, :fs4, :e4, :ds4]
    aligned_half_w_eighths [:e4, :b3, :b3, :cs4]
    aligned_half_quarters [:d4, :e4, :fs4]
    aligned_half_quarters [:g4, :g4, :g4]
    aligned_quarters [:g4, :fs4, :e4, :ds4]
    play_length :e4, 3
  end
end

def tenor
  # tenor
  in_thread do
    note_arrays= [
      [:e3, :g3, :e3, :fs3],
      [:b3, :b3, :b3, :g3],
      [:g3, :g3, :b3, :b3],
    ]
    
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_full [:e3, :fs3]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_half [:e3, :fs3]
    
    note_arrays=[
      [:gs3, :a3, :a3, :g3],
      [:g3, :g3, :g3, :g3],
      [:fs3, :g3, :g3, :a3],
    ]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    
    play_length :d4,1
    aligned_quarters [:d4, :c4, :b3, :a3]
    aligned_half_quarters [:g3, :g3, :g3]
    aligned_quarters [:d4, :c4, :b3, :b3]
    aligned_half_w_eighths [:g3, :g3, :g3, :g3]
    aligned_quarters [:fs3, :a3, :d4, :c4]
    aligned_quarters [:b3, :g3, :d4, :c4]
    aligned_quarters [:d4, :c4, :b3, :b3]
    play_length :g3, 3
  end
end

def bass
  # bass
  in_thread do
    note_arrays = [
      [:e3, :e3, :e3, :ds3],
      [:b2, :e3, :b2, :c3],
      [:g2, :c3, :b2, :e3],
    ]
    
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_full [:c3, :b2]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    end_cap_half [:c3, :b2]
    
    note_arrays=[
      [:e3, :a3, :fs3, :g3],
      [:e3, :b2, :c3, :g2],
      [:b2, :e3, :e3, :d3],
    ]
    note_arrays.each do |notes|
      straight_quarters notes
    end
    
    play_length :b2,1
    aligned_half_quarters [:d3, :e3, :fs3]
    aligned_half_quarters [:g3, :c3, :g3]
    aligned_quarters [:g2, :a2, :b2, :b2]
    aligned_half_w_eighths [:e3, :e3, :e3, :e3]
    aligned_quarters [:d3, :c3, :b2, :a4]
    aligned_quarters [:g2, :g3, :b2, :c3]
    aligned_quarters [:g2, :a2, :b2, :b2]
    sync :the_beat
    play_length :e3, 3
  end
end
loop do
  sleep 3
  puts "<=======>"
  soprano
  alto
  tenor
  bass
  sync :melody
end


