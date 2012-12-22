#!/bin/sh

# $1 - action
# $2 - type of file

action=$1
filetype=$2

do_view_action() {
    filetype=$1

    case "${filetype}" in
    html)
        links -dump "${MC_EXT_FILENAME}" 2>/dev/null || \
            w3m -dump "${MC_EXT_FILENAME}" 2>/dev/null || \
            lynx -dump -force_html "${MC_EXT_FILENAME}"
        ;;
    *)
        ;;
    esac
}

do_open_action() {
    filetype=$1

    case "${filetype}" in
    html)
				w3m "${MC_EXT_FILENAME}" || \
        elinks "${MC_EXT_FILENAME}" || \
        links "${MC_EXT_FILENAME}" || \
        lynx -force_html "${MC_EXT_FILENAME}" || \
        ${PAGER:-more} "${MC_EXT_FILENAME}"
        fi) 2>/dev/null
        ;;
    *)
        ;;
    esac
}

case "${action}" in
view)
    do_view_action "${filetype}"
    ;;
open)
    #xdg-open "${MC_EXT_FILENAME}" 2>/dev/null || \
        do_open_action "${filetype}"
    ;;
*)
    ;;
esac

