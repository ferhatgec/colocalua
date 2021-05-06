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
    local f = io.open(filename,'r')
    
    if f~=nil then 
        io.close(f) 

        return true 
    else 
        return false 
    end
 end
 
function print_top_header(length)
	io.write(BOLD_YELLOW_COLOR..'  ╭');

	local i = 0

	while i ~= length do
		io.write('───');

		i = i + 1;
	end

	io.write('╮\n '..' │ '..RESET);
end

function print_bottom_header(length)
	io.write(BOLD_LIGHT_CYAN_COLOR..'  ╰');

	local i = 0

	while i ~= length do
		io.write('───');

		i = i + 1;
	end

	io.write('╯\n'..RESET);
end

function header_text(text, language)
	print('🔒 '..BOLD_LIGHT_MAGENTA_COLOR..text..' | '..BOLD_LIGHT_RED_COLOR..language..RESET);
end

function regular(line)
	line = line:gsub('int ', BOLD_BLUE_COLOR..'int '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('char ', BOLD_BLUE_COLOR..'char '..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('const ',  BOLD_LIGHT_BLUE_COLOR..'const '..BOLD_LIGHT_WHITE_COLOR);			
	line = line:gsub('void ',  BOLD_RED_COLOR..'void '..BOLD_LIGHT_WHITE_COLOR);

	print(line);
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

function flascript(line)
	if (string.sub(line, 1, 1) == '/' and string.sub(line, 2, 2) == '/') then
        line = BOLD_LIGHT_BLACK_COLOR..line..BOLD_LIGHT_WHITE_COLOR;
    end

	line = line:gsub('print',  BOLD_CYAN_COLOR..'print'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('fprintf',  BOLD_CYAN_COLOR..'fprintf'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('@echo',  BOLD_CYAN_COLOR..'@echo'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('fprintln',  BOLD_CYAN_COLOR..'fprintln'..BOLD_LIGHT_WHITE_COLOR);

    line = line:gsub('@append',  BOLD_LIGHT_YELLOW_COLOR..'@append'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('@pop_back',  BOLD_LIGHT_YELLOW_COLOR..'@pop_back'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('@between',  BOLD_LIGHT_YELLOW_COLOR..'@between'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('@escape_seq',  BOLD_LIGHT_YELLOW_COLOR..'@escape_seq'..BOLD_LIGHT_WHITE_COLOR);
	
    line = line:gsub('@input',  BOLD_LIGHT_YELLOW_COLOR..'@input'..BOLD_LIGHT_WHITE_COLOR);
	
	
    line = line:gsub('var ', BOLD_BLUE_COLOR..'var '..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('bool', BOLD_LIGHT_BLUE_COLOR..'bool'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('int',  BOLD_LIGHT_BLUE_COLOR..'int'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('string',  BOLD_LIGHT_BLUE_COLOR..'string'..BOLD_LIGHT_WHITE_COLOR);

    line = line:gsub('put',  BOLD_MAGENTA_COLOR..'put'..BOLD_LIGHT_WHITE_COLOR);
    
	line = line:gsub('if',  BOLD_LIGHT_RED_COLOR..'if'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('else',  BOLD_LIGHT_RED_COLOR..'else'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('for',  BOLD_MAGENTA_COLOR..'for'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('do',  BOLD_MAGENTA_COLOR..'do'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('while',  BOLD_MAGENTA_COLOR..'while'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('func',  BOLD_RED_COLOR..'void'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('main',  BOLD_LIGHT_RED_COLOR..'main'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('import',  BOLD_YELLOW_COLOR..'import'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('defin',  BOLD_MAGENTA_COLOR..'defin'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('#ifdef',  BOLD_MAGENTA_COLOR..'#ifdef'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('#endif',  BOLD_MAGENTA_COLOR..'#endif'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('return',  BOLD_LIGHT_MAGENTA_COLOR..'return'..BOLD_LIGHT_WHITE_COLOR);
	
	
	line = line:gsub('SystemInfo',  BOLD_LIGHT_MAGENTA_COLOR..'SystemInfo'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('Colorized',  BOLD_LIGHT_MAGENTA_COLOR..'Colorized'..BOLD_LIGHT_WHITE_COLOR);
		
	line = line:gsub('newline',  BOLD_LIGHT_BLACK_COLOR..'newline'..BOLD_LIGHT_WHITE_COLOR);

	print(line)
end

function python(line)
	if string.sub(line, 1, 1) == '#' then
        line = BOLD_LIGHT_BLACK_COLOR..line..BOLD_LIGHT_WHITE_COLOR;
    end

	line = line:gsub('if',  BOLD_LIGHT_RED_COLOR..'if'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('else',  BOLD_LIGHT_RED_COLOR..'else'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('elif',  BOLD_LIGHT_RED_COLOR..'elif'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('for',  BOLD_MAGENTA_COLOR..'for'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('while',  BOLD_MAGENTA_COLOR..'while'..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('str', BOLD_BLUE_COLOR..'str'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('bool', BOLD_BLUE_COLOR..'bool'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('float', BOLD_BLUE_COLOR..'float'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('def',  BOLD_RED_COLOR..'def'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('lambda',  BOLD_RED_COLOR..'lambda'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('import',  BOLD_YELLOW_COLOR..'import'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('from',  BOLD_LIGHT_YELLOW_COLOR..'from'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('global',  BOLD_LIGHT_BLUE_COLOR..'global'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('return',  BOLD_LIGHT_MAGENTA_COLOR..'return'..BOLD_LIGHT_WHITE_COLOR);
		
	line = line:gsub('print',  BOLD_CYAN_COLOR..'print'..BOLD_LIGHT_WHITE_COLOR);
	
	print(line)
end

function read_file(filename)
    extension = filename:match('^.+(%..+)$')
	
	if (extension == '.cpp' 
	or extension == '.hpp'
	or extension == '.cc'
	or extension == '.hh'
	or extension == '.hxx'
	or extension == '.cxx') then
		for line in io.lines(filename) do
            c_plus_plus(line); 
        end
	elseif (extension == '.fls' or extension == '.flsh') then
		for line in io.lines(filename) do
			flascript(line);
        end
	elseif extension == '.py' then
		for line in io.lines(filename) do
			python(line);
        end
	else
		for line in io.lines(filename) do
			regular(line);
        end
	end
end

if exists(arg[1]) == false then
    os.exit(1);
end

print_top_header(10);

local extension = arg[1]:match('^.+(%..+)$')

if (extension == '.cpp' 
or extension == '.hpp'
or extension == '.cc'
or extension == '.hh'
or extension == '.hxx'
or extension == '.cxx') then
	header_text(arg[1], 'C++');
elseif (extension == '.fls' or extension == '.flsh') then
	header_text(arg[1], 'FlaScript');
elseif extension == '.py' then
	header_text(arg[1], 'Python');
else
	header_text(arg[1], 'Regular');
end

print_bottom_header(10);


read_file(arg[1]);