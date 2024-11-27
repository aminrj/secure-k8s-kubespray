
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