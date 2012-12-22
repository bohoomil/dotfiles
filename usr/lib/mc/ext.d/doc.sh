#!/bin/sh

# $1 - action
# $2 - type of file

action=$1
filetype=$2


STAROFFICE_REGEXP='\.(sxw|sdw|stw|sxc|stc|sxi|sti|sxd|std||sxm||sxg)$'

staroffice_console() {
    filename=$1;shift
    is_view=$1; shift
    if [ -n "${is_view}" ]; then
        is_view='-dump'
    fi

    tmp=`mktemp -d ${TMPDIR:-/tmp}/%p.XXXXXX`
    cd $tmp
    soffice2html.pl "${filename}"
    elinks ${is_view} content.html
    rm -rf "$tmp"
}

do_view_action() {
    filetype=$1

    case "${filetype}" in
    ps)
        ps2ascii "${MC_EXT_FILENAME}"
        ;;
    pdf)
        pdftotext -layout -nopgbrk "${MC_EXT_FILENAME}" -
        ;;
    odt)
				unzip -p "${MC_EXT_FILENAME}" content.xml | o3totxt | less
        ;;
    msdoc)

    which wvHtml >/dev/null 2>&1 &&
        {
            tmp=`mktemp -d ${TMPDIR:-/tmp}/%p.XXXXXX`
            wvHtml "${MC_EXT_FILENAME}" --targetdir="$tmp" page.html
            elinks -dump "$tmp/page.html"
            rm -rf "$tmp"
        } || \
            antiword -t "${MC_EXT_FILENAME}" || \
            catdoc -w "${MC_EXT_FILENAME}" || \
            word2x -f text "${MC_EXT_FILENAME}" - || \
            strings "${MC_EXT_FILENAME}"
        ;;
    msxls)
        which xlHtml >/dev/null 2>&1 && {
            tmp=`mktemp -d ${TMPDIR:-/tmp}/%p.XXXXXX`
            xlhtml -a "${MC_EXT_FILENAME}" > "$tmp/page.html"
            elinks -dump "$tmp/page.html"
            rm -rf "$tmp"
        } || \
            xls2csv "${MC_EXT_FILENAME}" || \
            strings "${MC_EXT_FILENAME}"
        ;;
		rtf)
				catdoc "${MC_EXT_FILENAME}" | less || strings "${MC_EXT_FILENAME}"
				;;
    dvi)
        dvi2tty "${MC_EXT_FILENAME}"
        ;;
    djvu)
        djvused -e print-pure-txt "${MC_EXT_FILENAME}"
        ;;
    *)
        ;;
    esac
}

do_open_action() {
    filetype=$1

    case "${filetype}" in
    ps)
				zathura "${MC_EXT_FILENAME}" >/dev/null 2>&1 &
        ;;
    pdf)
        (zathura "${MC_EXT_FILENAME}" >/dev/null 2>&1 &) || \
				(mupdf -b 8 "${MC_EXT_FILENAME}" >/dev/null 2>&1 &) || \
        (qpdfview --unique "${MC_EXT_FILENAME}" >/dev/null 2>&1 &) || \
        (okular "${MC_EXT_FILENAME}" >/dev/null 2>&1 &) || \
        (acroread "${MC_EXT_FILENAME}" &) || \
				(llpp "${MC_EXT_FILENAME}" 2>&1 &) || \
        (ghostview "${MC_EXT_FILENAME}" &)
        ;;
    ooffice)
        if [ -n "$DISPLAY" ]; then
            (ooffice "${MC_EXT_FILENAME}" &)
        else
            if [ ` echo "${MC_EXT_FILENAME}" | grep -c "${STAROFFICE_REGEXP}"` -ne 0 ]; then
                staroffice_console "${MC_EXT_FILENAME}"
            else
                odt2txt "${MC_EXT_FILENAME}" | ${PAGER:-more}
            fi
        fi
        ;;
    abw)
        (abiword "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        ;;
    msdoc)
        if [ -n "$DISPLAY" ]; then
            (abiword "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        else
            tmp=`mktemp -d ${TMPDIR:-/tmp}/%p.XXXXXX`
            wvHtml "${MC_EXT_FILENAME}" --targetdir="$tmp" page.html -1
            elinks "$tmp/page.html"
            rm -rf "$tmp"
        fi
        ;;
    msxls)
        if [ -n "$DISPLAY" ]; then
            (gnumeric "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        else
            tmp=`mktemp -d ${TMPDIR:-/tmp}/%p.XXXXXX`
            xlhtml -a "${MC_EXT_FILENAME}" > "$tmp/page.html"
            elinks "$tmp/page.html"
            rm -rf "$tmp"
        fi
        ;;
    msppt)
        if [ -n "$DISPLAY" ]; then
            (ooffice %f >/dev/null 2>&1 &)
        else
            tmp=`mktemp -d ${TMPDIR:-/tmp}/%p.XXXXXX`
            ppthtml %f > "$tmp/page.html"
            elinks "$tmp/page.html"
            rm -rf "$tmp"
        fi
        ;;
    framemaker)
        fmclient -f "${MC_EXT_FILENAME}"
        ;;
    dvi)
        if [ -n "$DISPLAY" ]; then
            (xdvi "${MC_EXT_FILENAME}" &)
        else
            dvisvga "${MC_EXT_FILENAME}" || \
                dvi2tty "${MC_EXT_FILENAME}" | ${PAGER:-more}
        fi
        ;;
    djvu)
        #djview "${MC_EXT_FILENAME}" &
				(zathura "${MC_EXT_FILENAME}" >/dev/null 2>&1 &) || \
				(okular "${MC_EXT_FILENAME}" >/dev/null 2>&1 &)
        ;;
		txt)
				vim "${MC_EXT_FILENAME}"
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
