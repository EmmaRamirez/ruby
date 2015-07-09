arr = [1, 2, 2, nil, 5, nil, 6]
arr.compact! # Removes nil and returns [1, 2, 2, 5, 6]
             # Otherwise, returns nil
