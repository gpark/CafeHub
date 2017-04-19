import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux';
import SessionReducer from './session_reducer';
import PreferenceReducer from './preference_reducer';

const RootReducer = combineReducers({
  routing: routerReducer,
  session: SessionReducer,
  preferences: PreferenceReducer
});

export default RootReducer;
