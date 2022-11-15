# Welcome to Sonic Pi
use_bpm 65
with_fx :reverb, room: 1 do
  live_loop :hi_hat do
    128.times do
      sample :drum_cymbal_closed, amp: 0.6
      sleep 0.5
    end
    loop do
      sample :drum_cymbal_open, amp: 0.6, rate: 1
      sleep 0.5
    end
  end
end

with_fx :reverb, room: 0.8 do
  live_loop :snare do
    32.times do
      sleep 1
      sample :elec_mid_snare
      sleep 1
    end
    loop do
      sample :drum_cymbal_hard
      sleep 1
      sample :elec_mid_snare, amp: 2
      if one_in(4)
        i = 0.5
        4.times do
          sample :drum_snare_hard, amp: i
          i = i + 0.5
          sleep 0.25
        end
      else
        sample :drum_snare_hard
        sleep 1
      end
    end
  end
end


with_fx :reverb, room: 0.8 do
  live_loop :bass_drum do
    sample :bd_klub, amp: 2
    sleep 0.5
    sample :bd_klub, amp: 2
    sleep 1
    sample :bd_klub, amp: 2
    sleep 0.5
    sample :bd_klub, amp: 2
    sleep 2
  end
end

with_fx :reverb, room: 0.8 do
  live_loop :noise do
    [:F2, :G2, :Bb2, :C2].each do |n|
      synth :hollow, note: n, sustain: 4, amp: 2
      sleep 4
    end
  end
end

with_fx :reverb, room: 1 do
  live_loop :piano_rhythm do
    4.times do
      synth :piano, note: :F4
      sleep 0.5
      synth :piano, note: :C4
      sleep 0.5
    end
    4.times do
      synth :piano, note: :G4
      sleep 0.5
      synth :piano, note: :Eb4
      sleep 0.5
    end
    4.times do
      synth :piano, note: :Bb4
      sleep 0.5
      synth :piano, note: :F4
      sleep 0.5
    end
    4.times do
      synth :piano, note: :G4
      sleep 0.5
      synth :piano, note: :Eb4
      sleep 0.5
    end
  end
end

live_loop :lead do
  use_synth :blade
  16.times do
    sleep 1
  end
  64.times do
    if one_in(4)
      chord(:C3, :minor7).reverse.each do |n|
        play n, release: 0.8, amp: 2
        sleep 0.25
      end
    else
      chord(:C3, :minor7).each do |n|
        play n, release: 0.8, amp: 2
        sleep 0.25
      end
    end
  end
  128.times do
    synth :blade, note: choose(chord(:C4, :minor7)), release: 0.8, amp: 2.5
    sleep 0.25
  end
  128.times do
    synth :blade, note: choose(scale(:C4, :minor_pentatonic, num_octaves: 2)), release: 0.8, amp: 3
    sleep 0.25
  end
  128.times do
    synth :blade, note: choose(scale(:C4, :minor_pentatonic, num_octaves: 3)), release: 0.8, amp: 3
    sleep 0.125
  end
  loop do
    chord(:C4, :minor7).each do |n|
      play n, release: 0.8, amp: 2
      sleep 0.25
    end
  end
end

live_loop :synth_hits do
  64.times do
    sleep 1
  end
  loop do
    synth :saw, note: [:F3, :C3], attack: 0.5, sustain: 2, release: 1, amp: 1
    sleep 4
    synth :saw, note: [:G3, :Eb4], attack: 0.5, sustain: 2, release: 1, amp: 1
    sleep 4
    synth :saw, note: [:Bb4, :F4], attack: 0.5, sustain: 2, release: 1, amp: 1
    sleep 4
    synth :saw, note: [:G3, :C4], attack: 0.25, sustain: 1.5, release: 0.25, amp: 1
    sleep 2
    synth :saw, note: [:G3, :Eb4], attack: 0.25, sustain: 1.5, release: 0.25, amp: 1
    sleep 2
  end
end






