#! /usr/bin/env bash

# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't hide errors within pipes
set -o pipefail
# trace what gets executed
set -o xtrace

readonly script_name=$(basename "${0}")
readonly script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
readonly repo_root="${script_dir}/../.."
readonly spm_support_dir="${script_dir}/__spm_support"
readonly spm_support_dir_sources="${spm_support_dir}/Sources"
readonly spm_support_dir_frameworks="${spm_support_dir}/Frameworks"
readonly camera_kit_artifacts_dir="${spm_support_dir}/ck"
readonly version_file="${repo_root}/VERSION"
readonly version_name=$( cat "${version_file}" | tr -d " \t\n\r" )

ck_fetch_latest() {
    local gcs_packages="gs://snapengine-maven-publish/camera-kit-ios/releases/${CAMERA_KIT_COMMIT}/${CAMERA_KIT_BUILD}/packages.zip"
    local packages_zip="${camera_kit_artifacts_dir}/packages.zip"

    rm -rf "${camera_kit_artifacts_dir}"

    mkdir -p "${camera_kit_artifacts_dir}"

    gsutil cp "${gcs_packages}" "${packages_zip}"

    pushd "${camera_kit_artifacts_dir}"

    unzip -q "${packages_zip}" "CameraKit/*" "CameraKitReferenceUI/*" "CameraKitReferenceSwiftUI/*" "CameraKitBaseExtension/*" "CameraKitPushToDeviceExtension/*" "CameraKitLoginKitAuth/*"


    rm -f "${packages_zip}"

    popd
}

main() {
    # download camera kit artifacts

    source "${repo_root}/samples/ios/CameraKitSample/.build"

    ck_fetch_latest

    rm -rf "${spm_support_dir_frameworks}"
    mkdir -p "${spm_support_dir_frameworks}"


    local sdk_names=("CameraKit" "CameraKitBaseExtension" "CameraKitLoginKitAuth" "CameraKitPushToDeviceExtension")

    for sdk_name in "${sdk_names[@]}"; do
        cp -R "${camera_kit_artifacts_dir}/${sdk_name}/Sources"/* "${spm_support_dir_frameworks}"
    done

    rm -rf "${spm_support_dir_sources}"
    mkdir -p "${spm_support_dir_sources}"

    # copy Reference UI sources
    mkdir -p "${spm_support_dir_sources}/SCSDKCameraKitReferenceUI"    
    cp -R "${camera_kit_artifacts_dir}/CameraKitReferenceUI/Sources"/* "${spm_support_dir_sources}/SCSDKCameraKitReferenceUI"

    mkdir -p "${spm_support_dir_sources}/SCSDKCameraKitReferenceSwiftUI"
    cp -R "${camera_kit_artifacts_dir}/CameraKitReferenceSwiftUI/Sources"/* "${spm_support_dir_sources}/SCSDKCameraKitReferenceSwiftUI"


    rm -rf "${camera_kit_artifacts_dir}"
}

main
