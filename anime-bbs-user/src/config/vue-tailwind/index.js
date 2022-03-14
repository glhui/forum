const requireSettings = require.context("./settings/", false, /\.js$/);
let settings = {};
requireSettings.keys().forEach(fileName => {
  const setting = requireSettings(fileName);
  settings = Object.assign({}, settings, setting.default || setting);
});

export default settings;
