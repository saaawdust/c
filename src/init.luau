--////////////////////////////////////////////////////////////
--//
--// c - Simple & fast time manipulation library
--// Copyright (C) 2023-2024 Gunshot Sound Studios
--//
--// This software is provided 'as-is', without any express or implied warranty.
--// In no event will the authors be held liable for any damages arising from the use of this software.
--//
--// Permission is granted to anyone to use this software for any purpose,
--// including commercial applications, and to alter it and redistribute it freely,
--// subject to the following restrictions:
--//
--// 1. The origin of this software must not be misrepresented;
--//    you must not claim that you wrote the original software.
--//    If you use this software in a product, an acknowledgment
--//    in the product documentation would be appreciated but is not required.
--//
--// 2. Altered source versions must be plainly marked as such,
--//    and must not be misrepresented as being the original software.
--//
--// 3. This notice may not be removed or altered from any source distribution.
--//
--////////////////////////////////////////////////////////////

-- second (x * 1)
-- minute (x * 60)
-- hour (x * 3600)
-- day (x * 86400)
-- week (7 days) (x * 604800)
-- month (x * 2628000)
-- year (x * 31540000)

local types = require(script.types)

local c = {
	peek = require(script.peek),
	some = require(script.some),
	none = require(script.none),
	time = require(script.time),
	timezone = require(script.timezone)
}

function c.second(value: number, time: types.time?): types.time?
	if time then
		if c.some(time) then
			return time + value
		else
			error("a valid time object was not provided")
		end
	else
		return value
	end
end

function c.minute(value: number, time: types.time?): types.time?
	value *= 60
	
	if time then
		if c.some(time) then
			return time + value
		else
			error("a valid time object was not provided")
		end
	else
		return value
	end
end

function c.hour(value: number, time: types.time?): types.time?
	value *= 3600
	
	if time then
		if c.some(time) then
			return time + value
		else
			error("a valid time object was not provided")
		end
	else
		return value
	end
end

function c.day(value: number, time: types.time?): types.time?
	value *= 86400
	
	if time then
		if c.some(time) then
			return time + value
		else
			error("a valid time object was not provided")
		end
	else
		return value
	end
end

return c
