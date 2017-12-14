
def bubble_sort_length(array)
  len = array.length - 1
  sorted = false
  until sorted
    sorted = true
    (0...len).each do |idx|
      if array[idx].length > array[idx + 1].length
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        sorted = false
      end
    end
  end
  array
end

def merge_sort_length(array)
  return array if array.length <= 1
  mid_idx = array.length / 2
  sorted_left = merge_sort_length(array[0...mid_idx])
  sorted_right = merge_sort_length(array[mid_idx..-1])
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first.length < right.first.length 
      result << left.shift
    else 
      result << right.shift
    end
  end
  result + left + right
end

#---------------------------
FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2)
def sluggish_octopus(fish)
  sorted_fish = bubble_sort_length(fish)
  sorted_fish[-1]
end
# O(nlogn)
def dominant_octopus(fish)
  sorted_fish = merge_sort_length(fish)
  sorted_fish[-1]
end
# O(n)
def clever_octopus(fish)
  result = ''
  fish.each {|f| result = f if f.length > result.length}
  result
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(move, tiles_array)
  tiles_array.each_index {|idx| return idx if move == tiles_array[idx]}
end

TILES_HASH = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5,
  "left" => 6, "left-up" => 7}
 
 def fast_dance(move, tiles_hash)
   tiles_hash[move]
 end
         
