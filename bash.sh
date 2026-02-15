#! /bin/env bash

# backup.sh

set -e

src_dir="$1"
backup_dir="backups"
timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="backup_${src_dir}_${timestamp}.tar.gz"

if [[ ! -d "$src_dir" ]]; then
echo "Error: ${src_dir} dir not exists!"
exit 1
fi

# make sure the backup dir
new ${backup_dir}

# show loading msg
echo "backup ..."

tar -czf "${backup_dir}/${backup_file}" "${src_dir}"


set +e