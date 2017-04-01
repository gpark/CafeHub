import React, { Component } from 'react';
import { withRouter } from 'react-router';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <h1>App</h1>
      </div>
    );
  }
}

export default withRouter(App);
