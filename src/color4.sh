#!/bin/bash
#set -Ceu
#-----------------------------------------------------------------------------
# ANSI Escape Codeにおける文字、背景、下線の色を4bitカラーで設定するSGRコードを出力する。
# Created: 2021-05-30T09:27:40+0900
#-----------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	declare -A GROUNDS=(
		["FORE"]=""
		["BACK"]=""
		["LINE"]=""
	)
	declare -A COLORS=(
		["FORE"]=7
		["BACK"]=0
		["LINE"]=7
	)
	while getopts :f:b:l: OPT; do
	case $OPT in
		f) GROUNDS["FORE"]=3;       COLORS["FORE"]=$OPTARG;;
		b) GROUNDS["BACK"]=4;       COLORS["BACK"]=$OPTARG;;
		l) GROUNDS["LINE"]='58;5;'; COLORS["LINE"]=$OPTARG;;
		*) eval "echo \"$(cat "$HERE/help.txt")\""
	esac
	done
	shift $((OPTIND - 1))
	[ 1 -le $# ] && { GROUNDS["FORE"]=3;       COLORS["FORE"]=$1; }
	[ 2 -le $# ] && { GROUNDS["BACK"]=4;       COLORS["BACK"]=$2; }
	[ 3 -le $# ] && { GROUNDS["LINE"]='58;5;'; COLORS["LINE"]=$3; }
	GetColorId3() {
		case $1 in
			0|k|black|K|BLACK)      echo '0';;
			1|r|red|R|RED)          echo '1';;
			2|g|green|G|GREEN)      echo '2';;
			3|y|yellow|Y|YELLOW)    echo '3';;
			4|b|blue|B|BLUE)        echo '4';;
			5|m|magenta|M|MAGENTA)  echo '5';;
			6|c|cyan|C|CYAN)        echo '6';;
			7|w|white|W|WHITE)      echo '7';;
			8|9|10|11|12|13|14|15)  echo "$1";;
			*) { echo 'エラー。色は数値(0-15)か字(k,r,g,y,b,m,c,w,K,R,G,Y,B,M,C,W)か名前(black,red,green,yellow,blue,magenta,cyan,white,BLACK,RED,GREEN,YELLOW,BLUE,MAGENTA,CYAN,WHITE)を指定してください。'; exit; };;
		esac
	}
	GetColorId8() {
		case $1 in
			0|k|black)    echo '0';;
			1|r|red)      echo '1';;
			2|g|green)    echo '2';;
			3|y|yellow)   echo '3';;
			4|b|blue)     echo '4';;
			5|m|magenta)  echo '5';;
			6|c|cyan)     echo '6';;
			7|w|white)    echo '7';;
			8|K|BLACK)    echo '8';;
			9|R|RED)      echo '9';;
			10|G|GREEN)   echo '10';;
			11|Y|YELLOW)  echo '11';;
			12|B|BLUE)    echo '12';;
			13|M|MAGENTA) echo '13';;
			14|C|CYAN)    echo '14';;
			15|W|WHITE)   echo '15';;
			*)          { echo 'エラー。色は数値(0-15)か字(k,r,g,y,b,m,c,w,K,R,G,Y,B,M,C,W)か名前(black,red,green,yellow,blue,magenta,cyan,white,BLACK,RED,GREEN,YELLOW,BLUE,MAGENTA,CYAN,WHITE)を指定してください。'; exit; };;
		esac
	}
	for g in ${!GROUNDS[@]}; do
		[ -z "${GROUNDS[$g]}" ] && continue
		[ 'LINE' == "$g" ] && COLOR_ID=$(GetColorId8 ${COLORS[$g]}) || COLOR_ID=$(GetColorId3 ${COLORS[$g]});
		[ 'LINE' != "$g" ] && [[ ${COLORS[$g]} =~ (K|R|G|Y|B|M|C|W|BLACK|RED|GREEN|YELLOW|BLUE|MAGENTA|CYAN|WHITE) ]] && { GROUNDS[$g]=$((GROUNDS[$g] + 6)); }
		[ 'LINE' != "$g" ] && [[ ${COLORS[$g]} =~ (8|9|10|11|12|13|14|15) ]] && { GROUNDS[$g]=$((GROUNDS[$g] + 6)); COLOR_ID=$((COLOR_ID - 8)); }
		SGR+=("${GROUNDS[$g]}$COLOR_ID")
	done
	echo "$(IFS=';'; echo "${SGR[*]}";)"
}
Run "$@"
