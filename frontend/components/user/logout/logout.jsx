import React, { Component } from 'react';
import { browserHistory, withRouter } from 'react-router';

class Logout extends Component {
  constructor(props) {
    super(props);
  }

  componentWillMount() {
    this.props.logout();
    browserHistory.push('/login');
  }

  render() {
    return null;
  }
}

export default withRouter(Logout);
