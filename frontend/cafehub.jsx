import React from 'react';
import ReactDOM from 'react-dom';
// import { browserHistory } from 'react-router';
// import { syncHistoryWithStore } from 'react-router-redux';

import Root from './components/root';
import { store, history } from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  // const store = configureStore();
  // const history = syncHistoryWithStore(browserHistory, store);

  window.store = store;

  ReactDOM.render(<Root store={store} history={history} />, root);
});
