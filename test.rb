# Реалізація
class MinHeap
  attr_reader :heap

  def initialize
    @heap = []
  end

  def insert(value)
    @heap << value
    heapify_up
  end

  def extract_min
    return nil if @heap.empty?

    min_value = @heap[0]
    last_value = @heap.pop

    unless @heap.empty?
      @heap[0] = last_value
      heapify_down
    end

    min_value
  end

  private

  def heapify_up
    current_index = @heap.length - 1

    while current_index.positive?
      parent_index = (current_index - 1) / 2

      break if @heap[current_index] >= @heap[parent_index]

      swap(current_index, parent_index)
      current_index = parent_index
    end
  end

  def heapify_down
    current_index = 0

    while true
      left_child_index = 2 * current_index + 1
      right_child_index = 2 * current_index + 2
      smallest = current_index

      if left_child_index < @heap.length && @heap[left_child_index] < @heap[smallest]
        smallest = left_child_index
      end

      if right_child_index < @heap.length && @heap[right_child_index] < @heap[smallest]
        smallest = right_child_index
      end

      break if smallest == current_index

      swap(current_index, smallest)
      current_index = smallest
    end
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end

# Приклад використання

heap = MinHeap.new

heap.insert(4)
heap.insert(8)
heap.insert(2)
heap.insert(7)

puts heap.heap # [2, 4, 8, 7]

min_value = heap.extract_min
puts min_value # 2
puts heap.heap # [4, 7, 8]

