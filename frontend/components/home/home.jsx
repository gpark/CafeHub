import React, { Component } from 'react';
import { Link, withRouter } from 'react-router';

class Home extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Home</h1>
      </div>
    );
  }
}

export default withRouter(Home);
