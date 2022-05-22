DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

echo "*** ------  prepare workspace ------ ***" 1>&2

mkdir -p $HOME/wks/src
