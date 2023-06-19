module(load="imtcp")
module(load="imptcp")
module(load="gtls")

global(
  defaultNetstreamDriver="gtls"
  defaultNetstreamDriverCAFile="/path/to/ca.pem"
  defaultNetstreamDriverCertFile="/path/to/cert.pem"
  defaultNetstreamDriverKeyFile="/path/to/key.pem"
)

input(type="imtcp" port="8003" ruleset="remote")
input(type="imptcp" port="514" ruleset="remote")

template(name="RemoteHostLog" type="list") {
  constant(value="/var/log/remote/")
  property(name="hostname")
  constant(value="/")
  property(name="timegenerated" dateFormat="year")
  constant(value="/")
  property(name="timegenerated" dateFormat="month")
  constant(value="/")
  property(name="timegenerated" dateFormat="day")
  constant(value="/")
  property(name="syslogfacility-text")
  constant(value="_")
  property(name="syslogseverity-text")
  constant(value=".log")
}

ruleset(name="remote") {
  action(type="omfile" dynaFile="RemoteHostLog")
}