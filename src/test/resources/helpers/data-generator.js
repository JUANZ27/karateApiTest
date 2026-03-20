function fn() {
  function randomString(len) {
    len = len || 8;
    var chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    var out = '';
    for (var i = 0; i < len; i++) out += chars.charAt(Math.floor(Math.random() * chars.length));
    return out;
  }

  function newUser(isAdmin) {
    var r = randomString(10);
    return {
      nome: 'QA User ' + r,
      email: 'qa.' + r + '@mail.com',
      password: '123456',
      administrador: isAdmin ? 'true' : 'false'
    };
  }

  return {
    randomString: randomString,
    newUser: newUser
  };
}