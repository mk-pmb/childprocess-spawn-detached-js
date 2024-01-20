// eslint-disable-next-line spaced-comment
/*jslint indent: 2, maxlen: 80, continue: false, unparam: false, node: true */
/* -*- tab-width: 2 -*- */
'use strict';

const libChildProcess = require('child_process');

const EX = function spawn(prog, args, origOpt) {
  if (!prog) { return false; }
  if (args && (!Array.isArray(args))) {
    if (origOpt) {
      throw TypeError('With explicit options, args must be array or false-y!');
    }
    if ((typeof args) !== 'object') {
      throw TypeError('2nd argument must be args array or options object!');
    }
    return EX(prog, false, args);
  }
  const opt = {
    detached: true,
    shell: !args,
    ...origOpt,
  };
  if (opt.detached && !opt.stdio) { opt.stdio = 'ignore'; }
  return libChildProcess.spawn(prog, args || [], opt);
};




module.exports = EX;
