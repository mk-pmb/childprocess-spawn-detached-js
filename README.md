
<!--#echo json="package.json" key="name" underline="=" -->
childprocess-spawn-detached
===========================
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
A slightly more concise API for `child_process.spawn()`.
<!--/#echo -->



API
---

This module exports one function:

### spawn(prog[, args][, opt])

Basically the same interface as `child_process.spawn()`, except:

* `opt.detached` is `true` by default.
* When `opt.detached`, a missing or false-y `opt.stdio` means `'ignore'`.
* When `args` is false-y, `opt.shell` defaults to `true`.



<!--#toc stop="scan" -->



Known issues
------------

* Needs more/better tests and docs.




&nbsp;


License
-------
<!--#echo json="package.json" key=".license" -->
ISC
<!--/#echo -->
