Getting started
===============

Pre-Requirements
----------------

You won't need so much, since [lynis](https://cisofy.com/lynis/) is completely written in bash with no dependencies. However, it is a good idea to have the following programs installed along with bash:

  - curl and wget
  - openssl

Download and extract to a local directory
-----------------------------------------

```
curl -s -L https://raw.githubusercontent.com/centriascolocation/lynis/2.7.5/get-lynis-latest.sh | bash
```

The first tests
---------------

Assume you've successfully downloaded the latest version:

```

  cd lynis
  ./lynis audit system --auditor "Michael Krieg <michael@centrias.de>" --pentest

```

Hint: you could omit the "--pentest" option for a full-privileged audit!

