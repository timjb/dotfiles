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

rmapi_config="${CUPS_CACHEDIR}/rmapi"
if [ ! -r "$rmapi_config" ]; then
  >&2 echo "ERROR: No rmapi config file! Place a copy of your .rmapi config file at ${rmapi_config} and make it readable and writable for all users."
  exit 1
fi
if [ ! -w "$rmapi_config" ]; then
  >&2 echo "ERROR: The config file ${rmapi_config} is not writable! Make it writable for all users."
  exit 1
fi

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
