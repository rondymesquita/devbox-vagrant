const {exec, invoke} = require('./src/jake-helpers')
const Env = require('./src/env')

const vagrantScripts = {
  "check": {
    desc: "Install NodeJS",
    exec: "vagrant provision --provision-with='check' "
  },
  "nodejs": {
    desc: "Install NodeJS",
    exec: "vagrant provision --provision-with='nodejs' "
  },
  "applications": {
    desc: "Install NodeJS",
    exec: "vagrant provision --provision-with='applications' "
  },
  "sublime-text": {
    desc: "Install NodeJS",
    exec: "vagrant provision --provision-with='sublime-text' "
  },
  "vbox-additions": {
    desc: "Install NodeJS",
    exec: "vagrant provision --provision-with='vbox-additions' "
  },
}

const hostScripts = {
  "check": {
    desc: "Install NodeJS",
    exec: "./scripts/check.sh"
  },
  "applications": {
    desc: "Install NodeJS",
    exec: "./scripts/install__applications.sh"
  },
  "sublime-text": {
    desc: "Install NodeJS",
    exec: "./scripts/install__sublime-text.sh"
  },
  "vbox-additions": {
    desc: "Install NodeJS",
    exec: "./scripts/install__vbox-additions.sh"
  },
}

task("default", function() {
  jake.showAllTaskDescriptions();
});

namespace("vm", function() {
  desc("Start VM");
  task("up", function() {
    exec("vagrant up");
  });

  namespace("install", function() {
    for (const name in vagrantScripts) {
      const script = vagrantScripts[name]
      desc(script.desc)
      task(name, async function () {
        await exec(script.exec)
      })
    }
  });
});

namespace("install", function() {
  for (const name in hostScripts) {
    const script = hostScripts[name]
    desc(script.desc)
    task(name, async function () {
      await exec(script.exec)
    })
  }
});
