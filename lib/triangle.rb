class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    triangle_sides = [side1, side2, side3].sort
    if triangle_sides.any?(&:zero?) || triangle_sides[0] + triangle_sides[1] <= triangle_sides[2]
      raise TriangleError, "Invalid triangle lengths"
    end
  end

  class TriangleError < StandardError
  end
end
