today = 20210923
p 3.step((today ** 0.5).ceil, 2).all? { |n| today % n > 0 }
