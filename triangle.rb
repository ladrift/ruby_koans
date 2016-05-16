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
def triangle(a, b, c)
  if [a, b, c].all?(&:zero?) or [a, b, c].any?(&:negative?)
    raise TriangleError
  end

  sorted = [a, b, c].sort!
  if sorted[0] + sorted[1] <= sorted.last
    raise TriangleError
  end

  true_values = [a, b, c].combination(2).map { |p| p[0] == p[1] }
  case true_values.count(true)
  when 3
    :equilateral
  when 1
    :isosceles
  when 0
    :scalene
  else
    :have_no_idea
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
