import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from './app';
import NotFound from './404';
import PreferenceContainer from './preference/preference_container';

class Root extends Component {
  constructor(props) {
    super(props);

    this._ensureLoggedIn = this._ensureLoggedIn.bind(this);
    this._redirectIfLoggedIn = this._redirectIfLoggedIn.bind(this);
  }

  _ensureLoggedIn(nextState, replace) {
    const currentUser = this.props.store.getState().session.currentUser;
    if (!currentUser) {
      replace('/signup');
    }
  }

  _redirectIfLoggedIn(nextState, replace) {
    const currentUser = this.props.store.getState().session.currentUser;
    if (currentUser) {
      replace('/dashboard');
    }
  }

  render() {
    return(
      <Provider store={this.props.store}>
        <Router history={browserHistory}>
          <Route path="/" component={App}>
            <Route path="preference" component={PreferenceContainer}/>
            <Route path="*" component={NotFound}/>
          </Route>
        </Router>
      </Provider>
    )
  }
}

export default Root;
