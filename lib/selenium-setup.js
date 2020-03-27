const chalk = require("chalk");
const selenium = require('selenium-download');
const path = require("path");
const binPath = path.join(__dirname, '..', 'bin');

selenium.ensure(binPath, function (error) {
  if (error){
    console.error(error.stack);
  } else {
    console.log( chalk.green('√ Selenium & Chromedriver downloaded to:', binPath) );
  }
  process.exit(0);
});
