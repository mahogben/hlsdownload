#!/bin/bash

# Name of the containing folder
GROUP="My Videos"

# INSERT LINKS TO VIDEOS HERE, in format as below
LINK=(
'<insert folder name for downloaded ts files>'
'http://s2.content.video.llnw.net/smedia/42f4e71183054396907c0dea18241568/yd/yLpoUEilVrxhhYSkpsyGMnn9t0N3AYxWmoMsM7Faw/francstireurs_entrevue_ep472_seq24.mpegts/playlist'
)

# ------------------------------------------------------------------------------
mkdir "$GROUP"
cd "$GROUP"

I=0
while [ $I -lt ${#LINK[@]} ]
do
  # create folder for streaming media
  TITLE=${LINK[$I]}
  mkdir "$TITLE"
  cd "$TITLE"
  mkdir 'parts'
  cd 'parts'

  J=$((I + 1))
  URL=${LINK[$J]}

  I=$((I + 2))

  DIR="${URL##*/}"

  # download all streaming media parts
  VID=-1
  while [ $? -eq 0 ];
  do
    VID=$((VID + 1))
    wget $URL''$VID.ts
  done
done
