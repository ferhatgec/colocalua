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

function html(line)
	line = line:gsub('html', BOLD_CYAN_COLOR..'html'..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('!DOCTYPE', BOLD_BLUE_COLOR..'!DOCTYPE'..BOLD_LIGHT_WHITE_COLOR);
	
	line = line:gsub('abbr', BOLD_CYAN_COLOR..'abbr'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('acronym', BOLD_CYAN_COLOR..'acronym'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('address', BOLD_CYAN_COLOR..'address'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('applet', BOLD_CYAN_COLOR..'applet'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('area', BOLD_CYAN_COLOR..'area'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('article', BOLD_CYAN_COLOR..'article'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('aside', BOLD_CYAN_COLOR..'aside'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('audio', BOLD_CYAN_COLOR..'audio'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('base', BOLD_CYAN_COLOR..'base'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('basefont', BOLD_CYAN_COLOR..'basefont'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('bb', BOLD_CYAN_COLOR..'bb'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('bdo', BOLD_CYAN_COLOR..'bdo'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('big', BOLD_CYAN_COLOR..'big'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('blockquote', BOLD_CYAN_COLOR..'blockquote'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('body', BOLD_CYAN_COLOR..'body'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('br', BOLD_CYAN_COLOR..'br'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('button', BOLD_CYAN_COLOR..'button'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('canvas', BOLD_CYAN_COLOR..'canvas'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('caption', BOLD_CYAN_COLOR..'caption'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('center', BOLD_CYAN_COLOR..'center'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('cite', BOLD_CYAN_COLOR..'cite'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('code', BOLD_CYAN_COLOR..'code'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('col', BOLD_CYAN_COLOR..'col'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('colgroup', BOLD_CYAN_COLOR..'colgroup'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('command', BOLD_CYAN_COLOR..'command'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('datagrid', BOLD_CYAN_COLOR..'datagrid'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('datalist', BOLD_CYAN_COLOR..'datalist'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('dd', BOLD_CYAN_COLOR..'dd'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('del', BOLD_CYAN_COLOR..'del'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('details', BOLD_CYAN_COLOR..'details'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('dfn', BOLD_CYAN_COLOR..'dfn'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('dialog', BOLD_CYAN_COLOR..'dialog'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('dir', BOLD_CYAN_COLOR..'dir'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('div', BOLD_CYAN_COLOR..'div'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('dl', BOLD_CYAN_COLOR..'dl'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('dt', BOLD_CYAN_COLOR..'dt'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('em', BOLD_CYAN_COLOR..'em'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('embed', BOLD_CYAN_COLOR..'embed'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('eventsource', BOLD_CYAN_COLOR..'eventsource'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('fieldset', BOLD_CYAN_COLOR..'fieldset'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('figcaption', BOLD_CYAN_COLOR..'figcaption'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('figure', BOLD_CYAN_COLOR..'figure'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('font', BOLD_CYAN_COLOR..'font'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('footer', BOLD_CYAN_COLOR..'footer'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('form', BOLD_CYAN_COLOR..'form'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('frame', BOLD_CYAN_COLOR..'frame'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('frameset', BOLD_CYAN_COLOR..'frameset'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('h1', BOLD_CYAN_COLOR..'h1'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('h2', BOLD_CYAN_COLOR..'h2'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('h3', BOLD_CYAN_COLOR..'h3'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('h4', BOLD_CYAN_COLOR..'h4'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('h5', BOLD_CYAN_COLOR..'h5'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('h6', BOLD_CYAN_COLOR..'h6'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('head', BOLD_CYAN_COLOR..'head'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('header', BOLD_CYAN_COLOR..'header'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('hgroup', BOLD_CYAN_COLOR..'hgroup'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('hr', BOLD_CYAN_COLOR..'hr'..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('iframe', BOLD_CYAN_COLOR..'iframe'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('img', BOLD_CYAN_COLOR..'img'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('input', BOLD_CYAN_COLOR..'input'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('ins', BOLD_CYAN_COLOR..'ins'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('isindex', BOLD_CYAN_COLOR..'isindex'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('kbd', BOLD_CYAN_COLOR..'kbd'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('keygen', BOLD_CYAN_COLOR..'keygen'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('label', BOLD_CYAN_COLOR..'label'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('legend', BOLD_CYAN_COLOR..'legend'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('li', BOLD_CYAN_COLOR..'li'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('link', BOLD_CYAN_COLOR..'link'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('map', BOLD_CYAN_COLOR..'map'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('mark', BOLD_CYAN_COLOR..'mark'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('menu', BOLD_CYAN_COLOR..'menu'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('meta', BOLD_CYAN_COLOR..'meta'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('meter', BOLD_CYAN_COLOR..'meter'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('nav', BOLD_CYAN_COLOR..'nav'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('noframes', BOLD_CYAN_COLOR..'noframes'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('noscript', BOLD_CYAN_COLOR..'noscript'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('object', BOLD_CYAN_COLOR..'object'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('ol', BOLD_CYAN_COLOR..'ol'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('optgroup', BOLD_CYAN_COLOR..'optgroup'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('option', BOLD_CYAN_COLOR..'option'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('output', BOLD_CYAN_COLOR..'output'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('p', BOLD_CYAN_COLOR..'p'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('param', BOLD_CYAN_COLOR..'param'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('pre', BOLD_CYAN_COLOR..'pre'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('progress', BOLD_CYAN_COLOR..'progress'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('q', BOLD_CYAN_COLOR..'q'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('rp', BOLD_CYAN_COLOR..'rp'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('rt', BOLD_CYAN_COLOR..'rt'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('ruby', BOLD_CYAN_COLOR..'ruby'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('script', BOLD_CYAN_COLOR..'script'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('samp', BOLD_CYAN_COLOR..'samp'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('section', BOLD_CYAN_COLOR..'section'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('select', BOLD_CYAN_COLOR..'select'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('small', BOLD_CYAN_COLOR..'small'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('source', BOLD_CYAN_COLOR..'source'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('span', BOLD_CYAN_COLOR..'span'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('strike', BOLD_CYAN_COLOR..'strike'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('strong', BOLD_CYAN_COLOR..'strong'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('style', BOLD_CYAN_COLOR..'style'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('sub', BOLD_CYAN_COLOR..'sub'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('sup', BOLD_CYAN_COLOR..'sup'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('table', BOLD_CYAN_COLOR..'table'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('tbody', BOLD_CYAN_COLOR..'tbody'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('tfoot', BOLD_CYAN_COLOR..'tfoot'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('th', BOLD_CYAN_COLOR..'th'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('thead', BOLD_CYAN_COLOR..'thead'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('time', BOLD_CYAN_COLOR..'time'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('title', BOLD_CYAN_COLOR..'title'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('tr', BOLD_CYAN_COLOR..'tr'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('track', BOLD_CYAN_COLOR..'track'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('tt', BOLD_CYAN_COLOR..'tt'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('u', BOLD_CYAN_COLOR..'u'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('ul', BOLD_CYAN_COLOR..'ul'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('var', BOLD_CYAN_COLOR..'var'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('video', BOLD_CYAN_COLOR..'video'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('wbr', BOLD_CYAN_COLOR..'wbr'..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('class', BOLD_CYAN_COLOR..'class'..BOLD_LIGHT_WHITE_COLOR);

	line = line:gsub('/', BOLD_YELLOW_COLOR..'/'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('<', BOLD_YELLOW_COLOR..'<'..BOLD_LIGHT_WHITE_COLOR);
	line = line:gsub('>', BOLD_YELLOW_COLOR..'>'..BOLD_LIGHT_WHITE_COLOR);

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
	elseif (extension == '.htm' or extension == '.html') then
		for line in io.lines(filename) do
			html(line);
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
elseif (extension == '.htm' or extension == '.html') then
	header_text(arg[1], 'HTML');
else
	header_text(arg[1], 'Regular');
end

print_bottom_header(10);


read_file(arg[1]);