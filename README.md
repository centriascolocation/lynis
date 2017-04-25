Getting started
===============

Download and extract to a local directory
-----------------------------------------

```
curl -s -L https://raw.githubusercontent.com/centriascolocation/lynis/1.2.1/get-lynis-latest.sh | bash
```

The first tests
---------------

Assume you've successfully downloaded version 2.4.8:

```
cd lynis-2.4.8
./lynis audit system --auditor "Michael Krieg <michael@centrias.de>" --pentest
```

Hint: you could omit the "--pentest" option for a full privileged (root/sudo) audit!

