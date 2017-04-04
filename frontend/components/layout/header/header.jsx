import React, { Component } from 'react';
import { Link, hashHistory, withRouter } from 'react-router';

class Header extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { currentUser, logout } = this.props;

    return (
      <div className="app-header" ref="header">
        <div className="logo">
          <Link to="/"><h1>CafeHub</h1></Link>
        </div>
      </div>
    );
  }
}

export default withRouter(Header);
