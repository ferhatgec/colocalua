#!/usr/bin/env lua

-- MIT License
--
-- Copyright (c) 2021 Ferhat Geçdoğan All Rights Reserved.
-- Distributed under the terms of the MIT License.
--

if (#arg < 1) then
    print('Colocalua - Lua implementation of ColoCat\n'..arg[0]..' {file}')
    os.exit(1);
end

local open = io.open

local BOLD_RED_COLOR          = '\x1b[1;31m'
local BOLD_GREEN_COLOR        = '\x1b[1;32m'
local BOLD_YELLOW_COLOR       = '\x1b[1;33m'
local BOLD_BLUE_COLOR         = '\x1b[1;34m'
local BOLD_MAGENTA_COLOR      = '\x1b[1;35m'
local BOLD_CYAN_COLOR         = '\x1b[1;36m'
local BOLD_LIGHT_BLACK_COLOR  = '\x1b[1;90m'
local BOLD_LIGHT_RED_COLOR    = '\x1b[1;91m'
local BOLD_LIGHT_GREEN_COLOR  = '\x1b[1;92m'
local BOLD_LIGHT_YELLOW_COLOR = '\x1b[1;93m'
local BOLD_LIGHT_BLUE_COLOR   = '\x1b[1;94m'
local BOLD_LIGHT_MAGENTA_COLOR= '\x1b[1;95m'
local BOLD_LIGHT_CYAN_COLOR   = '\x1b[1;96m'
local BOLD_LIGHT_WHITE_COLOR  = '\x1b[1;97m'
local RESET                   = '\x1b[0m'

function exists(filename)
    local f = io.open(filename,"r")
    
    if f~=nil then 
        io.close(f) 

        return true 
    else 
        return false 
    end
 end
 
function c_plus_plus(line)
    if (string.sub(line, 1, 1) == '/' and string.sub(line, 2, 2) == '/') then
        line = BOLD_LIGHT_BLACK_COLOR..line..BOLD_LIGHT_WHITE_COLOR;
    end

    line = line:gsub('int ', BOLD_BLUE_COLOR..'int '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('long ', BOLD_BLUE_COLOR..'long '..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('bool ', BOLD_BLUE_COLOR..'bool '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('char ', BOLD_BLUE_COLOR..'char '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('auto ', BOLD_BLUE_COLOR..'auto '..BOLD_LIGHT_WHITE_COLOR);

    line = line:gsub('if',  BOLD_LIGHT_RED_COLOR..'if'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('else',  BOLD_LIGHT_RED_COLOR..'else'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('for',  BOLD_MAGENTA_COLOR..'for'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('do',  BOLD_MAGENTA_COLOR..'do'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('while',  BOLD_MAGENTA_COLOR..'while'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('void ',  BOLD_RED_COLOR..'void '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('main',  BOLD_LIGHT_RED_COLOR..'main'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('asm',  BOLD_LIGHT_RED_COLOR..'asm'..BOLD_LIGHT_WHITE_COLOR);
	
	
	line = line:gsub('const ',  BOLD_LIGHT_BLUE_COLOR..'const '..BOLD_LIGHT_WHITE_COLOR);			
	line = line:gsub('static ',  BOLD_LIGHT_BLUE_COLOR..'static '..BOLD_LIGHT_WHITE_COLOR);			
	line = line:gsub('extern ',  BOLD_LIGHT_BLUE_COLOR..'extern '..BOLD_LIGHT_WHITE_COLOR);			
	line = line:gsub('inline ',  BOLD_LIGHT_BLUE_COLOR..'inline'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('virtual ',  BOLD_LIGHT_BLUE_COLOR..'virtual '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('friend ',  BOLD_LIGHT_BLUE_COLOR..'friend '..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('public',  BOLD_LIGHT_BLUE_COLOR..'public'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('private',  BOLD_LIGHT_BLUE_COLOR..'private'..BOLD_LIGHT_WHITE_COLOR);	
	line = line:gsub('protected',  BOLD_LIGHT_BLUE_COLOR..'protected'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('#include',  BOLD_YELLOW_COLOR..'#include'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('typedef ',  BOLD_MAGENTA_COLOR..'typedef '..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('#define ',  BOLD_MAGENTA_COLOR..'#define '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('#ifndef ',  BOLD_MAGENTA_COLOR..'#ifndef '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('#ifdef ',  BOLD_MAGENTA_COLOR..'#ifdef '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('#endif',  BOLD_MAGENTA_COLOR..'#endif'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('return ',  BOLD_LIGHT_MAGENTA_COLOR..'return '..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('nodiscard',  BOLD_LIGHT_BLACK_COLOR..'nodiscard'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('class ',  BOLD_LIGHT_YELLOW_COLOR..'class '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('struct ',  BOLD_LIGHT_YELLOW_COLOR..'struct '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('namespace ',  BOLD_LIGHT_YELLOW_COLOR..'namespace '..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('using ',  BOLD_GREEN_COLOR..'using '..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('std',  BOLD_LIGHT_YELLOW_COLOR..'std'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('iostream',  BOLD_LIGHT_MAGENTA_COLOR..'iostream'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('cstring',  BOLD_LIGHT_MAGENTA_COLOR..'cstring'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('sstream',  BOLD_LIGHT_MAGENTA_COLOR..'sstream'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('fstream',  BOLD_LIGHT_MAGENTA_COLOR..'fstream'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('memory',  BOLD_LIGHT_MAGENTA_COLOR..'memory'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('cstdlib',  BOLD_LIGHT_MAGENTA_COLOR..'cstdlib'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('cstdio',  BOLD_LIGHT_MAGENTA_COLOR..'cstdio'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('vector',  BOLD_LIGHT_MAGENTA_COLOR..'vector'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('algorithm',  BOLD_LIGHT_MAGENTA_COLOR..'algorithm'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('thread',  BOLD_LIGHT_MAGENTA_COLOR..'thread'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('array',  BOLD_LIGHT_MAGENTA_COLOR..'array'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('bitset',  BOLD_LIGHT_MAGENTA_COLOR..'bitset'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('deque',  BOLD_LIGHT_MAGENTA_COLOR..'deque'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('map',  BOLD_LIGHT_MAGENTA_COLOR..'map'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('stack',  BOLD_LIGHT_MAGENTA_COLOR..'stack'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('set',  BOLD_LIGHT_MAGENTA_COLOR..'set'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('iterator',  BOLD_LIGHT_MAGENTA_COLOR..'iterator'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('tuple',  BOLD_LIGHT_MAGENTA_COLOR..'tuple'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('locale',  BOLD_LIGHT_MAGENTA_COLOR..'locale'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('regex',  BOLD_LIGHT_MAGENTA_COLOR..'regex'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('istream',  BOLD_LIGHT_MAGENTA_COLOR..'istream'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('ostream',  BOLD_LIGHT_MAGENTA_COLOR..'ostream'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('cout',  BOLD_CYAN_COLOR..'cout'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('printf',  BOLD_CYAN_COLOR..'printf'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('getline',  BOLD_CYAN_COLOR..'getline'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('cin',  BOLD_CYAN_COLOR..'cin'..BOLD_LIGHT_WHITE_COLOR);

    print(line);
end

function read_file(filename)
    extension = filename:match('^.+(%..+)$')
    
    if extension == '.cpp' then
        for line in io.lines(filename) do
            c_plus_plus(line); 
        end
    else
        for line in io.lines(filename) do
            print(BOLD_LIGHT_WHITE_COLOR..line); 
        end
    end
end

if exists(arg[1]) == false then
    os.exit(1);
end

read_file(arg[1]);