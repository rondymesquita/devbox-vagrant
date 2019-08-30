const exec = function(cmd) {
  return new Promise(function(resolve, reject) {
    jake.exec(cmd, { printStdout: true, printStderr: true }, function() {
      complete();
      resolve();
    });
  });
};

const invoke = function(name) {
  return new Promise((resolve, reject) => {
    const t = jake.Task[name];
    t.addListener("complete", function() {
      complete();
      resolve();
    });
    t.reenable(true);
    t.invoke();
  });
};

module.exports = {
  exec,
  invoke
}
