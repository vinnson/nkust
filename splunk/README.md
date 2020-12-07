## Connection
URL: http://127.0.0.1:8000/zh-TW/account/login?return_to=%2Fzh-TW%2F
Login: admin/splunkhomework

## Target TIME
04/14/2014 to 04/19/2014

## mailsv/secure.log
## source="secure.log" sourcetype="mailsv"

```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=true
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
disabled=false
TIME_FORMAT=%a %b %d %Y %H:%M:%S
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
```

## vendor_sales/vendor_sales.log
## source="vendor_sales.log" sourcetype="vendor_sales"
```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=false
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
disabled=false
TIME_PREFIX=\[
```
### Custom Fields
VendorID=(?<vendorid>\d+) Code=(?<Code>\w+) AcctID=(?<acctid>\d+)

index=_* OR index=* sourcetype=vendor_sales

## www1/access.log
## source="access.log" sourcetype="access_combined_wcookie"

```sh
[ access_combined_wcookie ]
SHOULD_LINEMERGE=false
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
REPORT-access=access-extractions
TIME_PREFIX=\[
disabled=false
```
## www1/secure.log
## source="secure.log" sourcetype="www1_secure"

```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=true
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
disabled=false
```

## www2/access.log
## source="access.log" sourcetype="www2_access"

```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=true
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
disabled=false
```

## www2/secure.log
## source="secure.log" sourcetype="www2_secure"

```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=true
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
disabled=false
```

## www3/access.log
## source="access.log" sourcetype="www3_access"

```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=true
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
disabled=false
```

## www3/secure.log
## source="secure.log" sourcetype="www3_secure"

```sh
[ <SOURCETYPE NAME> ]
SHOULD_LINEMERGE=true
LINE_BREAKER=([\r\n]+)
NO_BINARY_CHECK=true
CHARSET=UTF-8
MAX_DAYS_AGO=10951
MAX_DAYS_HENCE=10950
disabled=false
```
