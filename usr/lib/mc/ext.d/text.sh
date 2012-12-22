#!/bin/sh

# $1 - action
# $2 - type of archive
# $3 - pager

action=$1
filetype=$2
pager=$3

get_unpacker() {
    filetype=$1
    case "${filetype}" in
    man.gz)
        unpacker="gzip -dc"
        ;;
    man.bz)
        unpacker="bzip -dc"
        ;;
    man.bz2)
        unpacker="bzip2 -dc"
        ;;
    man.lzma)
        unpacker="lzma -dc"
        ;;
    man.xz)
        unpacker="xz -dc"
        ;;
    esac
    echo ${unpacker}
}


do_view_action() {
    filetype=$1
    #pager=$2

    unpacker=`get_unpacker ${filetype}`

    case "${filetype}" in
    man)
        case "${MC_EXT_CURRENTDIR}"/"${MC_EXT_FILENAME}" in
        */log/*|*/logs/*)
            cat "${MC_EXT_FILENAME}"
            ;;
        *)
            { zsoelim "${MC_EXT_FILENAME}" 2>/dev/null || cat "${MC_EXT_FILENAME}"; } | nroff -c -Tlatin1 -mandoc
            ;;
        esac
        ;;
    pod)
        pod2man "${MC_EXT_FILENAME}" | nroff -c -Tlatin1 -mandoc
        ;;
    nroff.me)
        nroff -c -Tlatin1 -me "${MC_EXT_FILENAME}"
        ;;
    nroff.ms)
        nroff -c -Tlatin1 -ms "${MC_EXT_FILENAME}"
        ;;
    man.gz|man.bz|man.bz2|man.lzma|man.xz)
        case "${MC_EXT_CURRENTDIR}"/"${MC_EXT_FILENAME}" in
        */log/*|*/logs/*)
            ${unpacker} "${MC_EXT_FILENAME}"
            ;;
        *)
            ${unpacker} "${MC_EXT_FILENAME}" | nroff -c -Tlatin1 -mandoc
            ;;
        esac
        ;;
    *)
        ;;
    esac
}

do_open_action() {
    filetype=$1
    pager=$2

    unpacker=`get_unpacker ${filetype}`

    case "${filetype}" in
    info)
        info -f "${MC_EXT_FILENAME}"
        ;;
    man)
        case "${MC_EXT_CURRENTDIR}"/"${MC_EXT_FILENAME}" in
        */log/*|*/logs/*)
            cat "${MC_EXT_FILENAME}"
            ;;
        *)
            { zsoelim "${MC_EXT_FILENAME}" 2>/dev/null || cat "${MC_EXT_FILENAME}"; } | \
                nroff -c -Tlatin1 -mandoc
            ;;
        esac | ${pager}
        ;;
    pod)
        pod2man "${MC_EXT_FILENAME}" | nroff -c -Tlatin1 -mandoc | ${pager}
        ;;
    nroff.me)
        nroff -c -Tlatin1 -me "${MC_EXT_FILENAME}" | ${pager}
        ;;
    nroff.ms)
        nroff -c -Tlatin1 -ms "${MC_EXT_FILENAME}" | ${pager}
        ;;
    man.gz|man.bz|man.bz2|man.lzma|man.xz)
        case "${MC_EXT_CURRENTDIR}"/"${MC_EXT_FILENAME}" in
        */log/*|*/logs/*)
            ${unpacker} "${MC_EXT_FILENAME}"
            ;;
        *)
            ${unpacker} "${MC_EXT_FILENAME}" | nroff -c -Tlatin1 -mandoc
            ;;
        esac | ${pager}
        ;;
    chm)
        if [ -n "$DISPLAY" ]; then
            which kchmviewer > /dev/null 2>&1 \
                && (kchmviewer "${MC_EXT_FILENAME}" &) \
                || (xchm "${MC_EXT_FILENAME}" &)
        else
            chm_http "${MC_EXT_FILENAME}" & elinks http://localhost:8080/index.html
            kill -INT %1
        fi
        ;;
    *)
        ;;
    esac
}

case "${action}" in
view)
    do_view_action "${filetype}"
    #do_view_action "${filetype}" "${pager}"
    ;;
open)
    #xdg-open "${MC_EXT_FILENAME}" 2>/dev/null || \
        do_open_action "${filetype}" "${pager}"
    ;;
*)
    ;;
esac
