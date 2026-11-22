# tpersist-postgresql

`::tpersist_postgresql::connection_options config` reads and validates the driver options under `postgresql`.

`::tpersist_postgresql::connect options` takes a Tcl dictionary of PostgreSQL connection options and returns an open TDBC connection in the current interpreter. The caller owns and closes it.

```tcl
package require tpersist-postgresql
set db [::tpersist_postgresql::connect {-host localhost -database app -user app}]
try {
    $db allrows {SELECT 1} {}
} finally {
    $db close
}
```
