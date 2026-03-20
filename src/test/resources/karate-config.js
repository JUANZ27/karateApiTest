function fn() {
  var env = karate.env || 'dev';
  var config = {
    baseUrl: 'https://serverest.dev',
    usersPath: '/usuarios'
  };

  // helper JS
  config.dataGen = karate.callSingle('classpath:helpers/data-generator.js');

  return config;
}