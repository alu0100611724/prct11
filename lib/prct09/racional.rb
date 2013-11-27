require "prct09/gcd.rb"

class Racional

  attr_writer :num #numerador
  attr_writer :den #denominador

  include Comparable

  def initialize(num, den)
    #Comprobacion de datos introducidos
    raise ArgumentError, 'El denominador no puede ser cero' unless den != 0
    raise ArgumentError, 'El denominador no es numerico' unless den.is_a? Numeric
    raise ArgumentError, 'El numerador no es numerico' unless num.is_a? Numeric
     	        mcd = gcd(num, den)
                @num = num/mcd
                @den = den/mcd
  end
	def coerce(o)
		if o.is_a? Numeric  then n = Racional.new(o, 1) end
		return [n, self]
	end
	
	def num()#Devuelve el numerador @num
		@num
	end
	
	def denom()#Devuelve el denominador @den
		@den
	end

	def to_s()#Devuelve una cadena de la forma "1/2"
		"#@num/#@den"
	end

	def to_f()#Devuelve el resultado de la división en flotante
		num =  @num.to_f
		num / @den	
	end
	
	def abs()#Cambia la fracción por su valor absoluto
		if @num < 0
			@num = @num*-1
		end
		if @den < 0
			@den = @den*-1
		end
	end

	def reciprocal()#Cambia la fracción por su recíproca
		Racional.new(@den, @num)
	end

	def ==(ob)#Sobrecarga del operador == para que compare el objeto que invoca con el parametrico
		if @num == ob.num and @den ==  ob.denom and ob.instance_of? Racional
			true
		else
		false
		end
	end
	
	def -@#sobrecarga del operador - para calcular la inversa
		Racional.new(@num*-1, @den)
	end

	def +(other)
	  if other.class == Racional then
          	num = (@num * other.denom) + (other.num * @den)
          	den = (@den * other.denom)          	
	  else
		num = @num+ (other * @den)
		den = @den
    	  end
	return Racional.new(num, den)
	end

	def -(other)
	  if other.class == Racional then
         	 num = (@num * other.denom) - (other.num * @den)
          	den = (@den * other.denom)
	  else
		num = @num - (other * @den)
		den = @den
	  end
          Racional.new(num, den)
        end

	def *(other)
          num = (@num * other.num)
          den = (@den * other.denom)
          Racional.new(num, den)
        end

	def /(other)
          num = (@num * other.denom)
          den = (@den * other.num)
          Racional.new(num, den)
        end

	def %(other)
	  num = (@num % @den)
	  den = (other.num % other.denom)
	  Racional.new(num, den)
	end
	
	def eql?(o)
          return @num.eql?(o.num) && @den.eql?(o.denom) if o.instance_of? Racional
          false
        end
	
	def <=>(o)
          return nil unless o.instance_of? Racional
          @den*@den+@num*@num <=> o.denom*o.denom+o.num*o.num
        end
end

