#!/usr/bin/env bash
uname=`uname -s`

function link_file {
  source="${PWD}/$1"
  target="${HOME}/${1/_/.}"

  if [[ "$uname" = MINGW* || "$uname" = CYGWIN* ]]; then
    sourcestep=${source:2}
    source=${sourcestep//\//\\}
    targetstep=${target:2}
    target=${targetstep//\//\\}

    $COMSPEC \/c link.bat\ ${HOMEDRIVE}$source\ ${HOMEDRIVE}$target
    return
  else
    rm ${target}
    ln -sfv ${source} ${target}
  fi
}

if [ "$1" = "vim" ]; then
  for i in _vim*
  do
    link_file $1
  done
else
  for i in _*
  do
    link_file $i
  done
fi
