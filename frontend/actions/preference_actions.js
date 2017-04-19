import * as APIUtil from '../util/preference_api_util';

export const RECEIVE_PREFERENCE = "RECEIVE_PREFERENCE";
export const RECEIVE_PREFERENCE_ERRORS = "RECEIVE_PREFERENCE_ERRORS";

// sync functions
export const receivePreference = preference => ({
  type: RECEIVE_PREFERENCES,
  preference
});

export const receiveErrors = errors => ({
  type: RECEIVE_PREFERENCE_ERRORS,
  errors
});

// async functions
export const fetchPreference = () => dispatch => (
  APIUtil.fetchPreference()
    .then(response => dispatch(receivePreference(response)),
      err => dispatch(receiveErrors(err.responseJSON)))
);

export const setPreference = preference => dispatch => (
  APIUtil.setPreference(preference)
    .then(response => dispatch(receivePreference(response)),
      err => dispatch(receiveErrors(err.responseJSON)))
);
