package require tdbc::postgres
namespace eval ::tpersist_postgresql {namespace export connection_options connect}

proc ::tpersist_postgresql::connection_options {config} {
    set options [dict get $config postgresql]
    if {$options eq {}} {error "PostgreSQL connection options are required"}
    dict for {key value} $options {
        if {$key ni {-host -port -database -user -password -sslmode -timeout -encoding}} {
            error "unsupported PostgreSQL option: $key"
        }
    }
    return $options
}

proc ::tpersist_postgresql::connect {options} {
    return [::tdbc::postgres::connection new {*}$options]
}

package provide tpersist-postgresql 0.1.8
