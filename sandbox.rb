class File
  
  def tail(n)
    buffer = 1024
    idx = (size - buffer).abs
    chunks = []
    lines = 0

    begin
      seek(idx)
      chunk = read(buffer)
      lines += chunk.count("\n")
      chunks.unshift chunk
      idx -= buffer
    end while lines < n && pos != 0

    chunks.join.lines.reverse_each.take(n).reverse.join
  end
  
end

pula = File.new('README','rb')

pula.tail(4)
