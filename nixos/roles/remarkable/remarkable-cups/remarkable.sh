#!/usr/bin/env bash

# Source: https://ofosos.org/2018/10/22/printing-to-remarkable-cloud-from-cups/

set -e

backend=${0}
jobid=${1}
cupsuser=${2}
jobtitle=${3}
jobcopies=${4}
joboptions=${5}
jobfile=${6}

sanitized_jobtitle="$(echo ${jobtitle} | tr [[:blank:]:/%\&=+?\\\\#\'\`\´\*] _)"
outname="$TMPDIR/${sanitized_jobtitle}"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
rmapi_config="${DIR}/rmapi-config"

if [ ! -e ${DEVICE_URI#remarkable:} ]; then
  dir_on_device="${DEVICE_URI#remarkable:}"
else
  dir_on_device="/"
fi

upload_to_remarkable () {
  RMAPI_CONFIG="${rmapi_config}" rmapi put ${outname} ${dir_on_device}
}

case ${#} in
    0)
        # this case is for "backend discovery mode"
        echo "direct remarkable:/Print \"My reMarkable\" \"reMarkable Cloud\""
        exit 0
        ;;

    5)
        # backend needs to read from stdin if number of arguments is 5
        cat - > ${outname}
        upload_to_remarkable
        rm ${outname}
        ;;

    6)
        cat ${6} > ${outname}
        upload_to_remarkable
        rm ${outname}
        ;;
esac

exit 0
