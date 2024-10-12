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

local types = require(script.Parent.types)
local some = require(script.Parent.some)

local time = {}

--13:13:20

--20 + (13 * 60) + (13 * 3600) + (10 * 86400) + (12 * 2628000)

function time.now(): types.time
	local time = os.date("*t")
	
	local daySeconds = time.day * 86400
	local hourSeconds = time.hour * 3600
	local minuteSeconds = time.min * 60
	
	return daySeconds + hourSeconds + minuteSeconds + time.sec
end

function time.ago(amount: types.time): types.time?
	if some(amount) then
		return time.now() - amount
	else
		error("a valid time object was not provided")
	end
end

function time.after(amount: types.time): types.time?
	if some(amount) then
		return time.now() + amount
	else
		error("a valid time object was not provided")
	end
end

return time
