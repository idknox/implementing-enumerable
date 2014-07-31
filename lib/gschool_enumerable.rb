module GschoolEnumerable

  def g_each
    for i in self
      yield(i)
    end
  end

  def g_select
    output=[]
    self.g_each { |i| output << i if yield(i) }
    output
  end

  def g_reject
    output = []
    self.g_each { |i| output << i if !yield(i) }
    output
  end

  def g_map
    output = []
    self.g_each { |i| output << yield(i) }
    output
  end

  def g_find
    self.g_each { |i| return i if yield(i) }
    nil
  end

  def g_select!
    self.g_each { |i| self.delete(i) if !yield(i) }
    self
  end
end
