import React, { Component } from 'react';
import { Provider } from 'react-redux';

// History
import { Router, Route, IndexRoute } from 'react-router';

// Token login
import { tokenLogin } from '../actions/session_actions';

// Main layouts
import App from './app';
import NotFound from './404';

// Session views
import SignupContainer from './user/signup/signup_container';
import LoginContainer from './user/login/login_container';
import LogoutContainer from './user/logout/logout_container';

// Home views
import HomeContainer from './home/home_container';

// Preference views
import PreferenceContainer from './preference/preference_container';

class Root extends Component {
  constructor(props) {
    super(props);

    this._ensureLoggedIn = this._ensureLoggedIn.bind(this);
    this._redirectIfLoggedIn = this._redirectIfLoggedIn.bind(this);
  }

  getToken() {
    return localStorage.getItem('sessionToken');
  }

  _ensureLoggedIn(nextState, replace) {
    const token = this.getToken();
    const currentUser = this.props.store.getState().session.currentUser;

    if (!token) {
      replace('/login');
    } else if (token && !currentUser){
      this.props.store.dispatch(tokenLogin(token));
    }
  }

  _redirectIfLoggedIn(nextState, replace) {
    const token = this.getToken();
    const currentUser = this.props.store.getState().session.currentUser;

    if (token && !currentUser) {
      this.props.store.dispatch(tokenLogin(token))
        .then(() => replace('/'));
    } else if (token && currentUser) {
      replace('/');
    }
  }

  render() {
    return(
      <Provider store={this.props.store}>
        <Router history={this.props.history}>
          <Route path="/" component={App}>
            <IndexRoute component={HomeContainer} onEnter={this._ensureLoggedIn}/>
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
