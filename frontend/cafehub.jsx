import React from 'react';
import ReactDOM from 'react-dom';

import Root from './components/root';
import { store, history } from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');

  window.store = store;

  ReactDOM.render(<Root store={store} history={history} />, root);
});
