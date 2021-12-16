# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def validate_triangle_sides!(sides)
  if sides.min <= 0
    raise TriangleError, "Sides cannot be lower than 1"
  end

  largest_side = sides.max
  sides.delete_at(sides.index largest_side)
  if largest_side >= sides.sum
    raise TriangleError, "Any two sides of a triangle should add up to more than the third side."
  end
end

def triangle(a, b, c)
  sides = [a, b, c]
  validate_triangle_sides! [a,b,c]

  case (sides.uniq.length)
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
