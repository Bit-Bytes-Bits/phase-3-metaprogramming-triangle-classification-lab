require "pry"

class Triangle
  # write code here
  attr_reader :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def kind
    raise_error

    if length1 == length2 && length2 == length3
      :equilateral
    elsif length1 == length2 || length1 == length3 || length2 == length3
      :isosceles
    else
      :scalene
    end
  end

  def raise_error
    raise TriangleError unless triangle_inequality? && length_size?
  end

  def length_size?
    length1 > 0 && length2 > 0 && length3 > 0
    # [length1, length2, length3].all?(&:positive?)
  end

  def triangle_inequality?
    length1 + length2 > length3 && length1 + length3 > length2 && length2 + length3 > length1
  end

  class TriangleError < StandardError
  end
end

binding.pry
