import React, { Component } from 'react';
import { Link, withRouter, browserHistory } from 'react-router';
import { merge } from 'lodash';

class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidUpdate() {
    this.redirectIfLoggedIn();
  }

  redirectIfLoggedIn() {
    if (this.props.currentUser) {
      browserHistory.push('/');
    }
  }

  update(field) {
    return e => this.setState({[field]: e.currentTarget.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = merge({}, this.state);
    this.props.login(user)
      .then(user => {
        localStorage.setItem('sessionToken', user.auth_token)
      });
  }

  renderErrors() {
    return (
      <ul className="error-list">
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`} className="error-list-item">
            {error}
          </li>
        ))}
      </ul>
    );
  }

  render() {
    return (
      <div className="login-form-container">
        {this.renderErrors()}
        <form onSubmit={this.handleSubmit} className="login-form">
          <input type="text"
						placeholder="email"
						value={this.state.email}
						onChange={this.update("email")}
						className="form-control"
            aria-describedby="sizing-addon2"/>

          <input type="password"
						placeholder="password"
						value={this.state.password}
						onChange={this.update("password")}
						className="form-control"
            aria-describedby="sizing-addon2"/>

          <input type="submit"
						className="btn btn-default"/>
        </form>
      </div>
    );
  }
}

export default withRouter(Login);
