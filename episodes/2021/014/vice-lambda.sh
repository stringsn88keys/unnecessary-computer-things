function handler() {
  cd vice
  SEED=$((0 - `od -An -N2 -i /dev/random`))
  ./x128 -silent -sound -keybuf "
  3 i=rnd($SEED)
  `cat ../maze.bas`
  run
  " -warp -limitcycles 20000000 -exitscreenshotvicii /tmp/$1.png 2>&1 >/dev/null
  cd ..

  #RESPONSE="{\"isBase64Encoded\": true, \"headers\": {\"Content-type\": \"image/png\", \"content-disposition\":\"attachment; filename=$1.png\"}, \"statusCode\":200, \"body\":\"`base64 -w 0 /tmp/$1.png`\"}"
  RESPONSE="{\"isBase64Encoded\": true, \"headers\": {\"Content-type\": \"image/png\", \"content-disposition\":\"inline\"}, \"statusCode\":200, \"body\":\"`base64 -w 0 /tmp/$1.png`\"}"

  echo $RESPONSE
}
