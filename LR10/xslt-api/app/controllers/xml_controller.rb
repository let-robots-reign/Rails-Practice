class XmlController < ApplicationController

  def index
    factorials = check_simon_theory
    factorials.map! { |elem| {id: elem[0], factorial: elem[1], multipliers: [elem[2] - 1, elem[2], elem[2] + 1]} }

    respond_to do |format|
      format.xml { render xml: factorials.to_xml }
      format.rss { render xml: factorials.to_xml }
    end
  end

  def check_simon_theory(max_n = 20)
    result = []
    id = 0
    # n! = m * (m + 1) * (m + 2)  (m in [1; n^(1/3)])
    (0..max_n).each do |n|
      fact = get_factorial(n)
      (2..(fact ** (1.0 / 3)).round).each do |k|
        if (k - 1) * k * (k + 1) == fact
          result.push [id, n, k]
          id += 1
        end
      end
    end
    result
  end

  def get_factorial(n)
    (1..n).reduce(1, :*)
  end
end
