names = ["cat", "cat", "dog", "mouse", "panther", "lion", "panther", "tiger"]

puts(names.group_by(&:itself).transform_values(&:count))