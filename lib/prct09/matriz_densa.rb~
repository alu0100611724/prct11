require 'prct09/matriz.rb'

class Matriz_densa < Matriz

	attr_accessor :m

        def initialize (matriz)
               raise ArgumentError, 'El parametro debe ser una matriz' unless matriz.is_a? Array
               @m = matriz
		super(matriz.length, matriz[0].length)
        end

	def max
		max = -10000
		for i in 0...@fi 
			for k in 0...@co
				if (@m[i][k] > max) then
					max=@m[i][k] 
				end
			end
		end
		max
	end

	def min
                min = 10000
                for i in 0...fi
                        for k in 0...co
                                if @m[i][k] < min then
                                        min=@m[i][k]
                                end
                        end
                end     
                min
        end

end
