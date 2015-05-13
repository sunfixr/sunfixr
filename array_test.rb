## This is the text editor interface.
## Anything you type or change here will be seen by the other person in real time.

# Array#flatten
# [1, 2, [3, 4, [5, 6, 7]]].flatten => [1, 2, 3, 4, 5, 6, 7]


# Array#map was ALWAYS going to return an array
# So call it recursively (while elegant and fancy) was never going to work.
# the best I could do was to iteratively flatten the arrays until there were no more
# now to look in the Ruby source for the real answer

class Array
  def flatten
    result = self.clone
    result=result.reduce([]){|a,e| puts e.to_s + ' ' + a.to_s; e.is_a?(Array)  ? e.each{|x|a << x } : a << e; a} while result.any?{|z| z.is_a?(Array)}
    result
  end
end






class Array

  def flatten
    flatten_array([],self)
  end

  private

  def flatten_array(result,ary)
    ary.each{|e| e.is_a?(Array) ? flatten_array(result,e) : result << e}
    result
  end


end

puts "flatten: " +  [1,2,3,[4,5,6,[7,8,9]]].flatten.to_s #[1, 2, [3, 4, [5, 6, 7]]].flatten.inspect
