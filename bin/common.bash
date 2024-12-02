# Check for this mistake https://github.com/koalaman/shellcheck/wiki/SC2088
# shellcheck disable=SC2088
if [[ "${CK8S_CONFIG_PATH:0:2}" == "~/" ]]; then
    echo "Warning: CK8S_CONFIG_PATH starts with unexpanded ~/" 1>&2
    echo "This will create a new folder in cwd called ~ instead of referencing ${HOME}" 1>&2
    echo "please use \${HOME} instead if that's what you want" 1>&2
fi

# Create CK8S_CONFIG_PATH if it does not exist and make it absolute
CK8S_CONFIG_PATH=$(readlink -m "${CK8S_CONFIG_PATH}")
mkdir -p "${CK8S_CONFIG_PATH}"
export CK8S_CONFIG_PATH

here="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
root_path="${here}/.."
# shellcheck disable=SC2034
config_defaults_path="${root_path}/config"
# shellcheck disable=SC2034
kubespray_path="${root_path}/kubespray"

log_info() {
    echo -e "[\e[34mck8s\e[0m] ${*}" 1>&2
}

log_info_no_newline() {
    echo -e -n "[\e[34mck8s\e[0m] ${*}" 1>&2
}

log_info() {
    log_info_no_newline "${*}\n"
}

log_warning_no_newline() {
    echo -e -n "[\e[33mck8s\e[0m] ${*}" 1>&2
}

log_warning() {
    log_warning_no_newline "${*}\n"
}

log_error_no_newline() {
    echo -e -n "[\e[31mck8s\e[0m] ${*}" 1>&2
}

log_error() {
    log_error_no_newline "${*}\n"
}