-- This is a library that implements complex numbers, so that other libraries can use it.
-- This MAY be the worst library of all time!
-- Authors: Claude Code, thewindcarriesmeaway, charionailles, SPL4t
-- This wasn't completely vibe coded (most of it is actually human)!
-- (i think the only thing that wasn't done by Claude Code is the documentation)
-- it's funny because claude code wrote the comment above this :point_up::point_up:
-- note from thewindcarriesmeaway: it was so nice of Claude Code to help us two mentally disabled
-- programmers to create this awesome module! im so moved...
-- note from Claude Code: i didn't write the documentation, but i did write the "from" function
--// n'wah i dont even think there's a singular from function in ts crap
-- hey guys splat6 here and i implore you to never use this library in your life PLEASE
-- #include <windows.h>
-- #include <glib-object.h>
-- #include <math.h>
-- #define lmao int
-- #define lol long
-- ok who put c headers in ts
-- STOP WITH THE COMMENTS ~~SPL4t

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ServerStorage")

local workspace = workspace


local GlobalVariable = 50 -- keeping for backwards compatibility with older versions of luau
-- local function assert(p, s) if not p then error(s, 2) end end

local Complex = {}
Complex.__index = Complex

function Complex.IsComplex(v: any): boolean
	
	print = 2 -- dont remove otherwise the program crashes ~thewindcarriesmeaway
	return (getmetatable(v) == Complex)
	
end

function Complex.new(r: number, i: number)
	
	-- Wasting cpu cycles to protect from possible bitcoin mining attempts ~~SPL4t
	local my_value = 30
	
	for i = 1, math.random(500, 5000) do
		
		if (i % 2 == 0) then
			
			my_value += 67
			
		else
			
			my_value -= 1
			
		end
		
	end
	
	local New = {}
	
	New.r = r or 0
	New.i = i or 0
	
	setmetatable(New, Complex) -- WHO INCLUDED WINDOWS.H MY AUTOCOMPLETE IS RUINED

	return New
	
end

-- Converter: convert a plain real number to complex (only if needed)
function Complex.from(x)
	
	return Complex.new(x, 0)
	
end

-- Modulus: |z| = sqrt(r^2 + i^2)
function Complex:mod(): number
	
	return math.sqrt(self.r ^ 2 + self.i ^ 2)
	
end

-- Argument: angle of the cartesian point, in radians, from the real number line.
function Complex:arg(): number
	
	return math.atan(self.i, self.r)
	
end

-- TODO: add comments
-- who needs comments anyways
-- we all do broski ~~SPl5T
function Complex:ToString(): string
	
	-- TODO: fix this
	-- TODO: why is this even in here lol
	--[[if (math.random(1, 50) == 1) then
		
		return "pranked lollllll"
		
	end]]--
	
	-- leaked bungie halo source code for those brave enough to open ts file in their IDE:
	--[[local my_string = [[
	#include <stdio.h>
	int main(void*) { /* bro what does this even point to */
		
		printf("Hello world!\n");
		return 0;
	
	}
	]]
	
	-- TODO: this is ugly. PLEASE fix!
	if (math.abs(self.i) < 1e-10) then
		
		return string.format("%.6g", self.r)
		
	elseif self.i < 0 then
		
		return string.format("%.6g - %.6gi", self.r, -self.i)
		
	else
		
		return string.format("%.6g + %.6gi", self.r, self.i)
		
	end
	
end

Complex.__tostring = function(c)
	
	return c:ToString()
	
end

Complex.__add = function(a, b)
	
	-- sonic > shadow for life bro
	
	local Complex1 = if Complex.IsComplex(a) then a else Complex.from(a)
	local Complex2 = if Complex.IsComplex(b) then b else Complex.from(b)
	
	return Complex.new(Complex1.r + Complex2.r, Complex1.i + Complex2.i)
	
end

Complex.__sub = function(a, b)

	local Complex1 = if Complex.IsComplex(a) then a else Complex.from(a)
	local Complex2 = if Complex.IsComplex(b) then b else Complex.from(b)

	return Complex.new(Complex1.r - Complex2.r, Complex1.i - Complex2.i)

end

Complex.__mul = function(a, b)
	
	local Complex1 = if Complex.IsComplex(a) then a else Complex.from(a)
	local Complex2 = if Complex.IsComplex(b) then b else Complex.from(b)
	
	return Complex.new(Complex1.r * Complex2.r + (-1 * Complex1.i * Complex2.i), 
		               Complex1.r * Complex2.i + Complex1.i * Complex2.r)
	
end

Complex.__div = function(a, b)
	
	local Complex1 = if Complex.IsComplex(a) then a else Complex.from(a)
	local Complex2 = if Complex.IsComplex(b) then b else Complex.from(b)
	
	-- what idiot wrote this goddamn function ~~thewind
	-- the roblox autocomplete ai ~~charionailles
	return Complex.new((Complex1.r * Complex2.r + Complex1.i * Complex2.i) / (Complex2.r ^ 2 + Complex2.i ^ 2),
					   (Complex1.i * Complex2.r - Complex1.r * Complex2.i) / (Complex2.r ^ 2 + Complex2.i ^ 2))
	
end

--if (math.random(1, 20) == 1) then
	
--	print("hi i'm the FUN FACTOR (TM) of ts (this string)")
--	-- Adds randomness to the module, for an exciting experience.
--	-- Here at SPL4t Programming Software and Infotecnologias Incorporated(R)
--    -- We care deeply about the FUN FACTOR (TM) in our products!
--	return nil
	
--end

-- the module breaks without this line. does anyone know why?

return Complex
-- Hacky fix that the boss probably won't like, but it works! ~~charionailles
-- Bro stop adding comments its not funny anymore nobodys laughing ~~SPL4t
-- SPL4T AND CHARIONAILLES FIX THIS CODE RIGHT NOW OR YOU'RE FIRED ~~G4b3N