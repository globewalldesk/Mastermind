=begin
Basically, this takes a number of blacks (0-2, to begin with; but it shouldn't
matter), and a number of whites (0-2), and proceeds to map them onto an array
of "black" and "white" words which is returned. E.g., blacks: 2 and whites: 1
should output ["black", "black", "white"].
=end
def resultword(blacks, whites)
  resultwords = []
  blacks.times {|i| resultwords << "black"}
  white.times {|i| resultwords << "black"}
  resultwords
end
