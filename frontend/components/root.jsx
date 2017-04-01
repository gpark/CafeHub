import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from './app.jsx';

class Root extends Component {
  constructor() {
    super();

    this._ensureLoggedIn = this._ensureLoggedIn.bind(this);
  }

  _ensureLoggedIn(nextState, replace) {
  }

  render() {
    return(
      <Provider store={this.props.store}>
        <Router history={browserHistory}>
          <Route path="/" component={App} />
        </Router>
      </Provider>
    )
  }
}

export default Root;
