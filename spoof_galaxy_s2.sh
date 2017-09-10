#!/bin/bash
# Script to edit the android build.prop file in order for a device to change its identity.
# Note: Requires root! Recommended to be run from the terminal in TWRP recovery.

fail_if_not_running_as_root ()
{
    local user_id
    user_id=$(id -u)

    if [ $user_id -ne 0 ]
    then
        echo "This script needs to run as root." >&2
        exit 1
    fi
}

fail_if_system_is_not_mounted ()
{
    mountpoint -q /system

    if [ $? -ne 0 ]
    then
        echo "This script needs /system to be mounted." >&2
        exit 1
    fi
}

fail_if_sed_is_not_available ()
{
    local sed_path
    sed_path=$(which sed)

    if [ $? -ne 0 ]
    then
        echo "This script needs sed but it is not available." >&2
        exit 1
    fi
}

change_build_property ()
{
    local argument_count
    argument_count=$#

    if [ $argument_count -ne 2 ]
    then
        echo "change_build_property expects 2 arguments." >&2
        exit 1
    fi

    if [ -z "$1" ] || [ -z "$2" ]
    then
        echo "change_build_property does not accept empty arguments." >&2
        exit 1
    fi

    local build_prop_path
    build_prop_path="/system/build.prop"

    if [ ! -f "$build_prop_path" ]
    then
        echo "Cannot find $build_prop_path to modify." >&2
        exit 1
    fi

    local search_pattern
    search_pattern="/$1=/="

    local line_number
    line_number=$(sed --quiet "$search_pattern" "$build_prop_path")

    if [ $? -ne 0 ] || [ -z "$line_number" ]
    then
        echo "Cannot find the build property '$1'." >&2
        exit 1
    fi

    local replacement_pattern
    replacement_pattern=$line_number"s|.*|$1=$2|"

    sed -i "$replacement_pattern" "$build_prop_path"

    if [ $? -ne 0 ]
    then
        echo "Cannot edit the build property '$1'." >&2
        exit 1
    fi
}

fail_if_not_running_as_root

fail_if_system_is_not_mounted

fail_if_sed_is_not_available

change_build_property "ro.product.model" "GT-I9100"
change_build_property "ro.product.brand" "samsung"
change_build_property "ro.product.name" "GT-I9100"
change_build_property "ro.product.device" "GT-I9100"
change_build_property "ro.product.manufacturer" "samsung"
change_build_property "ro.build.description" "samsung-user 6.0.1 IMM76D ZSLPQ release-keys"
change_build_property "ro.build.fingerprint" "samsung/GT-I9100/GT-I9100:4.0.4/IMM76D/ZSLPQ:user/release-keys"
