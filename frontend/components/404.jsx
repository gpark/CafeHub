import React from 'react';
import { Link, withRouter } from 'react-router';

class NotFound extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Not found!</h1>
      </div>
    );
  }
}

export default withRouter(NotFound);
