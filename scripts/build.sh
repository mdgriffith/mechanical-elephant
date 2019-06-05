elm make src/Main.elm --output=assets/elm.js --optimize
google-closure-compiler --js=assets/elm.js --js_output_file=assets/elm.min.js
gzip assets/elm.min.js
cp -a assets/. public/
mv public/elm.min.js.gz public/elm.js
