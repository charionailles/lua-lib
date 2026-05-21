-- Base lua version of ComplexMath_final.luau, to be used outside of roblox

local Complex = {}
Complex.__index = Complex

function Complex.IsComplex(v)
	
	return (getmetatable(v) == Complex)
	
end

function Complex.new(r, i)

	if ((type(r) ~= "number") or (type(i) ~= "number")) then
		
		error("r and i must be numbers for complex constructor")

	end

	local New = {}
	
	New.r = r or 0
	New.i = i or 0
	
	setmetatable(New, Complex)

	return New
	
end

-- Build a complex number from a real number (imaginary part = 0)
function Complex.from(x)
	
	return Complex.new(x, 0)
	
end

-- Modulus: |z| = sqrt(r^2 + i^2)
function Complex:mod()
	
	return math.sqrt(self.r ^ 2 + self.i ^ 2)
	
end

-- Argument: angle of the cartesian point, in radians, from the real number line.
function Complex:arg()
	
	return math.atan(self.i, self.r)
	
end

function Complex:ToString()

	-- Value that is considered close enuff to zero
	local EPSILON = 1e-10

	if (math.abs(self.i) < EPSILON) then
		
		return string.format("%.6g", self.r)
		
	elseif (self.i < 0) then
		
		return string.format("%.6g - %.6gi", self.r, math.abs(self.i))
		
	else
		
		return string.format("%.6g + %.6gi", self.r, math.abs(self.i))
		
	end
	
end

Complex.__tostring = function(c)
	
	return c:ToString()
	
end

-- The math meta functions use the lua style "terneary" to build a complex number from the normal number data type if needed
Complex.__add = function(a, b)

	local Complex1 = (Complex.IsComplex(a) and a) or Complex.from(a)
	local Complex2 = (Complex.IsComplex(b) and b) or Complex.from(b)
	
	return Complex.new(Complex1.r + Complex2.r, Complex1.i + Complex2.i)
	
end

Complex.__sub = function(a, b)

	local Complex1 = (Complex.IsComplex(a) and a) or Complex.from(a)
	local Complex2 = (Complex.IsComplex(b) and b) or Complex.from(b)

	return Complex.new(Complex1.r - Complex2.r, Complex1.i - Complex2.i)

end

Complex.__mul = function(a, b)
	
	local Complex1 = (Complex.IsComplex(a) and a) or Complex.from(a)
	local Complex2 = (Complex.IsComplex(b) and b) or Complex.from(b)
	
	return Complex.new(Complex1.r * Complex2.r + (-1 * Complex1.i * Complex2.i), 
		               Complex1.r * Complex2.i + Complex1.i * Complex2.r)
	
end

Complex.__div = function(a, b)
	
	local Complex1 = (Complex.IsComplex(a) and a) or Complex.from(a)
	local Complex2 = (Complex.IsComplex(b) and b) or Complex.from(b)
	
	return Complex.new((Complex1.r * Complex2.r + Complex1.i * Complex2.i) / (Complex2.r ^ 2 + Complex2.i ^ 2),
					   (Complex1.i * Complex2.r - Complex1.r * Complex2.i) / (Complex2.r ^ 2 + Complex2.i ^ 2))
	
end

return Complex