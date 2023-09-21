=begin rdoc
The class Axby1 is an equation ax+by=1.
When it is created, two arguments are given.
They are the constants a and b.
An instance method 'solve' returns a pair of the solution [x, y].

It uses euclidian algorithm.
=end
class Axby1
  attr_accessor :a, :b
  # Two arguments a and b are the constants of ax+by=1.
  # They must be coprime.
  # Otherwise the methods 'solve' returns nil.
  def initialize a = nil, b = nil
    if a.instance_of?(Integer) && b.instance_of?(Integer) && a.gcd(b) == 1
      @a, @b = a, b
    else
      @a = @b = nil
    end
  end

  # Returns the solution of ax+by=1.
  # It uses euclidian algorithm so it takes short time to get an answer even if a and b are very big.
  def solve
    if @a == nil || @b == nil
      return nil
    end
    d = []
    d << [@a,@b,@a/@b,@a.modulo(@b)]
    until d[-1][3] == 0 do
      d << euclid(d[-1])
    end

    e = []
    a = d.pop
    # a[1] = 1 or -1
    e << [a[0],a[1],a[1],-a[1]*(a[2]-1)]
    while (a = d.pop) do
      e << [a[0],e[-1][3],a[1],e[-1][1]-e[-1][3]*a[2]]
    end

    if e[-1][1] >= 0
      [e[-1][1], e[-1][3]]
    else
      [e[-1][1]+@b, e[-1][3]-@a]
    end
  end

  private

  def euclid d
    [d[1], d[3], d[1]/d[3], d[1].modulo(d[3])]
  end
end
