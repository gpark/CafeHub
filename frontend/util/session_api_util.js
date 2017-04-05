// returns a session token with user info
export const login = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/users/sign_in',
    data: { user }
  });
};

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
