import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { browserHistory } from 'react-router';
import { routerMiddleware, syncHistoryWithStore } from 'react-router-redux';

import rootReducer from '../reducers/root_reducer.js';

const _defaultState = {};

const configureStore = (preloadedState = _defaultState) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(thunk, routerMiddleware(browserHistory))
  )
);

export const store = configureStore();

export const history = syncHistoryWithStore(browserHistory, store);
