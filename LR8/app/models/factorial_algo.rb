class FactorialAlgo < ActiveRecord::Base
  def self.check_simon_theory(max_n = 20)
    result = []
    id = 0
    # n! = m * (m + 1) * (m + 2)  (m in [1; n^(1/3)])
    (0..max_n).each do |n|
      fact = get_factorial(n)
      (2..(fact ** (1.0/3)).round).each do |k|
        if (k - 1) * k * (k + 1) == fact
          result.push [id, n, k]
          id += 1
        end
      end
    end
    result
  end

  def self.get_factorial(n)
    (1..n).reduce(1, :*)
  end
end
