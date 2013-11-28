require 'prct09/matriz.rb'

class SparseVector 
  attr_accessor :vector

  def initialize(h = {})
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  def [](i)
    if  @vector[i].class == nil.class
	0
    else
	@vector[i]
    end 
  end

  def to_s
    @vector.to_s
  end
  def keys
    @vector.keys
  end
end

class Matriz_dispersa < Matriz

  attr_accessor :m

  def initialize(h = {})
    fi,co= 0,0
    @m = Hash.new({})
    for k in h.keys do
      if (k>fi) then fi=k end 
      @m[k] = if h[k].is_a? SparseVector
                     h[k]
                   else 
                     @m[k] = SparseVector.new(h[k])
                   end
      for j in h[k].keys do
	if (j>co) then co=j end
      end
    end
    super(fi+1, co+1)
  end

  def [](i)
    if @m[i].class == SparseVector then
	@m[i]
    else
	0
    end
  end

  def max
    max = @m[0][0]
    for i in @m.keys do
	for j in @m[i].keys do
	    if (@m[i][j] > max) then
      		max = @m[i][j] 
	    end
	end
    end
    max
   end
   def min
    min = @m[0][0]
    for i in @m.keys do
        for j in @m[i].keys do
            if (@m[i][j] < min) then
                min = @m[i][j]       
            end
        end
    end
    min
   end
	 def m
		return @m
	 end

	 def to_den
			a = Array.new(@fi)
			for i in 0...@fi
				b = Array.new(@co)
				for j in 0...@co
					b[j]	= @m[i][j]
				end
				a[i] = b
			end
			return Matriz_densa.new(a)
	 end
	 def -(o)
		a = self.to_den
		if o.class == Matriz_dispersa then
    	for i in o.m.keys do
        	for j in o.m[i].keys do
          	a[i][j] = a[i][j] - o[i][j]
        	end
      	end
    	return a.m
		else
			a-o
		end
	end
  def +(o)
    a = self.to_den
    if o.class == Matriz_dispersa then
      for i in o.m.keys do
          for j in o.m[i].keys do
            a[i][j] = a[i][j] + o[i][j]
          end
        end	
      return a.m
    else
      a+o
    end
  end
	def *(o)
		a = self.to_den
		if o.class == Matriz_dispersa then
			return a * o.to_den
		else
			return a * o
		end
	end


end
