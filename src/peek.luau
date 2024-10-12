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

local some = require(script.Parent.some)
local types = require(script.Parent.types)

local peek = {}

function peek.second(value: types.time): number
	return value % 60
end

function peek.minute(value: types.time): number
	return math.floor(value / 60) % 60
end

function peek.hour(value: types.time): number
	return math.floor(value / 3600) % 24
end

function peek.day(value: types.time): number
	return (math.floor(value / 86400) % 31)
end


return peek	
