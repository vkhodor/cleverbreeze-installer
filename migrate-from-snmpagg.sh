#! /bin/bash

function usage {
  echo "$0 <src-directory> <dest-directory>"
  echo "Example:"
  echo "         $0 /root/snmpagg/webgui /root/cleverbreeze/cleverbreeze-ui"
  exit $1
}

if [ -z "$1" ]; then
  usage 1
fi

if [ -z "$2" ]; then
  usage 2
fi
migration_script_directory="../cleverbreeze/tools/"
if [ ! -z "$3" ]; then
  migration_script_directory="${3}"
fi

src_directory="${1}"
dest_directory="${2}"
migration_script="migrate_from_snmpagg.py"


timestamp=$(date '+%Y-%m-%d_%H%M%S')

echo "[DEBUG] timestamp = ${timestamp}"
echo "[DEBUG] src_directory = ${src_directory}"
echo "[DEBUG] dest_directory = ${dest_directory}"

need_migration="1"

if [ "$(strings ${src_directory}/controllers.sqlite | grep -c controller_id)" -ne "0" ]; then
  echo "[WARN] Found new database version at ${src_directory}!"
  echo "[INFO] Will copy files without migration."
  need_migration="0"
fi

if [ -f "${dest_directory}/controllers.sqlite" ]; then
  echo "[INFO] Found ${dest_directory}/controllers.sqlite"
  mv -v "${dest_directory}/controllers.sqlite" "${dest_directory}/controllers.sqlite.bkp.${timestamp}"
fi

if [ -f "${dest_directory}/datadb.sqlite" ]; then
  echo "[INFO] Found ${dest_directory}/datadb.sqlite"
  mv -v "${dest_directory}/datadb.sqlite" "${dest_directory}/datadb.sqlite.bkp.${timestamp}"
fi

if [ $need_migration -eq "1" ]; then
  echo "[INFO] Starting migration process..."
  sleep 15s
  cd "${migration_script_directory}" || exit 10
  ./${migration_script} $src_directory $dest_directory
else
  cp -v "${src_directory}/controllers.sqlite" "${dest_directory}/controllers.sqlite"
  cp -v "${src_directory}/datadb.sqlite" "${dest_directory}/datadb.sqlite"
fi
