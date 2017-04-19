// returns user preferences
export const fetchPreference = () => {
  return $.ajax({
    method: 'GET',
    url: `/api/preferences/view`,
  });
};

// set user preferences
export const setPreference = (preference) => {
  return $.ajax({
    method: 'PATCH',
    url: `/api/preferences/change`,
    data: { preference }
  });
}
