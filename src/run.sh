#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# 4bitカラーの糖衣構文ツールをつくる。
# CreatedAt: 2021-06-04
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	COLOR4="$HERE/color4.sh"
	Color4() { echo -e "\e[4;$("$COLOR4" ${@:2})m$1\e[m"; }
	echo $("$COLOR4" red green blue)
	echo $("$COLOR4" RED GREEN BLUE)
	echo $("$COLOR4" 9 10 12)
	echo $("$COLOR4" r)
	echo -e "\e[4;$("$COLOR4" red green blue)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" r g b)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" r g)m文字＝赤、背景＝緑\e[m"
	echo -e "\e[4;$("$COLOR4" r)m文字＝赤\e[m"
	echo -e "\e[4;$("$COLOR4" 1 2 4)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" -f 1 -b 2 -l 4)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" -f r -b g -l b)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" -f red -b green -l blue)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo ''
	echo -e "\e[4;$("$COLOR4" RED GREEN BLUE)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" R G B)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" R G)m文字＝赤、背景＝緑\e[m"
	echo -e "\e[4;$("$COLOR4" R)m文字＝赤\e[m"
	echo -e "\e[4;$("$COLOR4" 9 10 12)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" -f 9 -b 10 -l 12)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" -f R -b G -l B)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo -e "\e[4;$("$COLOR4" -f RED -b GREEN -l BLUE)m文字＝赤、背景＝緑、下線＝青\e[m"
	echo ''
	Color4 '文字＝赤、背景＝緑、下線＝青' red green blue
	Color4 '文字＝赤、背景＝緑、下線＝青' r g b
	Color4 '文字＝赤、背景＝緑' r g
	Color4 '文字＝赤' r
	Color4 '文字＝赤、背景＝緑、下線＝青' 1 2 4
	Color4 '文字＝赤、背景＝緑、下線＝青' -f red -b green -l blue
	Color4 '文字＝赤、背景＝緑、下線＝青' -f r -b g -l b
	Color4 '文字＝赤、背景＝緑、下線＝青' -f 1 -b 2 -l 4
	echo ''
	Color4 '文字＝赤、背景＝緑、下線＝青' RED GREEN BLUE
	Color4 '文字＝赤、背景＝緑、下線＝青' R G B
	Color4 '文字＝赤、背景＝緑' R G
	Color4 '文字＝赤' R
	Color4 '文字＝赤、背景＝緑、下線＝青' 9 10 12
	Color4 '文字＝赤、背景＝緑、下線＝青' -f RED -b GREEN -l BLUE
	Color4 '文字＝赤、背景＝緑、下線＝青' -f R -b G -l B
	Color4 '文字＝赤、背景＝緑、下線＝青' -f 9 -b 10 -l 12
}
Run "$@"
