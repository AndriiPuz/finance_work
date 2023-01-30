module ReportsHelper

  def operation_sum(arr)
    arr.map {|el| el[1]}.sum
  end

end
