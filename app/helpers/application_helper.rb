module ApplicationHelper
  def average_array(data)
    data.mean.round(2) unless data.empty?
  end
end
