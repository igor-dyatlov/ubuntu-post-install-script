#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Sam Hewitt <hewittsamuel@gmail.com>
#
# Description:
#   A post-installation bash script for Ubuntu
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# tab width
tabs 4
clear

#----- Import Functions -----#

dir="$(dirname "$0")"

. $dir/functions/check
. $dir/functions/cleanup
. $dir/functions/codecs
. $dir/functions/configure
. $dir/functions/development
. $dir/functions/favourites
. $dir/functions/kernel
. $dir/functions/thirdparty
. $dir/functions/update
. $dir/functions/utilities

#----- Fancy Messages -----#
show_error(){
echo -e "\033[1;31m$@\033[m" 1>&2
}
show_info(){
echo -e "\033[1;32m$@\033[0m"
}
show_warning(){
echo -e "\033[1;33m$@\033[0m"
}
show_question(){
echo -e "\033[1;34m$@\033[0m"
}
show_success(){
echo -e "\033[1;35m$@\033[0m"
}
show_header(){
echo -e "\033[1;36m$@\033[0m"
}
show_listitem(){
echo -e "\033[0;37m$@\033[0m"
}

# Main
function main {
    eval `resize`
    MAIN=$(whiptail \
        --notags \
        --title "Ubuntu Post-Install Script" \
        --menu "\nЧем бы Вы хотели заняться?" \
        --ok-button "Выполнить" \
        --cancel-button "Выйти" \
        $LINES $COLUMNS $(( $LINES - 12 )) \
        update      'Выполнить обновление системы' \
        favourites  'Установить любимые приложения' \
        utilities   'Установить любимые системные утилиты' \
        development 'Установить любимые инструменты разработки' \
        codecs      'Установить мультимедийные кодеки' \
        thirdparty  'Установить сторонние приложения' \
        configure   'Настройка системы' \
        kernel      'Обновить ядро системы' \
        cleanup     'Очистка системы' \
        3>&1 1>&2 2>&3)
     
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        clear && $MAIN
    else
        clear && quit
    fi
}

# Quit
function quit {
    if (whiptail --title "Выход" --yesno "Вы уверены, что хотите выйти?" 10 60) then
        exit 99
    else
        clear && main
    fi
}

#RUN
check && main

#END OF SCRIPT
