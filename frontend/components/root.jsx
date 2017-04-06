import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, browserHistory } from 'react-router';

import App from './app';
import NotFound from './404';

// Session views
import SignupContainer from './user/signup/signup_container';
import LoginContainer from './user/login/login_container';
import LogoutContainer from './user/logout/logout_container';

// Preference views
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
      replace('/login');
    }
  }

  _redirectIfLoggedIn(nextState, replace) {
    const currentUser = this.props.store.getState().session.currentUser;
    if (currentUser) {
      replace('/preference');
    }
  }

  render() {
    return(
      <Provider store={this.props.store}>
        <Router history={browserHistory}>
          <Route path="/" component={App}>
            <Route path="signup" component={SignupContainer} onEnter={this._redirectIfLoggedIn}/>
            <Route path="login" component={LoginContainer} onEnter={this._redirectIfLoggedIn}/>
            <Route path="logout" component={LogoutContainer}/>
            <Route path="preference" component={PreferenceContainer} onEnter={this._ensureLoggedIn}/>
            <Route path="*" component={NotFound}/>
          </Route>
        </Router>
      </Provider>
    )
  }
}

export default Root;
