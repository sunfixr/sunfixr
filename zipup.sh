git tag $1
rm -f sunfixr-*.zip
zip -r sunfixr-$1.zip ./ -x .\*/\* tmp/\* log/\* public/assets/\*