# Source this file to setup development environment

if [ "$(basename $SHELL)" == "bash" ]; then
  WD=$(readlink -f $(dirname "$BASH_SOURCE"))
else
  WD=$(readlink -f $(dirname "$0"))
fi

NODE_PATH=$WD/..
NODEJS_BIN=$WD/../node_modules/.bin
PATH=$NODEJS_BIN:$PATH
PATH=`awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH`

export NODE_PATH
export PATH

if [ -f $WD/dev_env.local.sh ]; then
  . $WD/dev_env.local.sh
fi

npm install
npm update
