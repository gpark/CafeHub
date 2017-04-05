import React, { Component } from 'react';
import { Link, withRouter } from 'react-router';
import { merge } from 'lodash';

class Signup extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      signUpCode: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => this.setState({[field]: e.currentTarget.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = merge({}, this.state);
    this.props.signup(user);
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
						placeholder="name"
						value={this.state.name}
						onChange={this.update("name")}
						className="form-control"
            aria-describedby="sizing-addon2"/>

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

          <input type="password"
            placeholder="password confirmation"
            value={this.state.passwordConfirmation}
            onChange={this.update("passwordConfirmation")}
            className="form-control"
            aria-describedby="sizing-addon2"/>

          <input type="text"
						placeholder="sign up code"
						value={this.state.signUpCode}
						onChange={this.update("signUpCode")}
						className="form-control"
            aria-describedby="sizing-addon2"/>

          <input type="submit"
						className="btn btn-default"/>
        </form>
      </div>
    );
  }
}

export default withRouter(Signup);
