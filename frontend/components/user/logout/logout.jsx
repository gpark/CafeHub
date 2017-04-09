import React, { Component } from 'react';
import { withRouter, browserHistory } from 'react-router';

class Logout extends Component {
  constructor(props) {
    super(props);
  }

  componentWillMount() {
    this.props.logout().then(() => browserHistory.push('/'));
  }

  render() {
    return null;
  }
}

export default withRouter(Logout);
