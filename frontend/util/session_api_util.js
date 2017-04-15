// returns a session token with user info
export const login = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/users/sign_in',
    data: { user }
  });
};

// if user has a token already, use that to login
export const tokenLogin = (token) => {
  return $.ajax({
    method: 'POST',
    url: '/users/token_login',
    data: { session_token: token }
  });
}

// returns a session token with user info
export const signup = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/users',
    data: { user }
  });
};

// handle logout
export const logout = () => {
  return $.ajax({
    method: 'DELETE',
    url: '/users/sign_out'
  });
};
