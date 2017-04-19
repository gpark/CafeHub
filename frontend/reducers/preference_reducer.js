import {
  RECEIVE_PREFERENCES,
  RECEIVE_PREFERENCE_ERRORS } from '../actions/preference_actions';
import merge from 'lodash/merge';

const _nullPreference = Object.freeze({
  userPreference: null,
  errors: []
});

const PreferenceReducer = (state = _nullPreference, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_PREFERENCE:
      const userPreference = action.preference;
      return merge({}, _nullPreference, { userPreference });
    case RECEIVE_PREFERENCE_ERRORS:
      const errors = action.errors;
      return merge({}, _nullPreference, { errors });
    default:
      return state;
  }
};

export default PreferenceReducer;
