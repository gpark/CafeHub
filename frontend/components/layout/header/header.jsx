import React, { Component } from 'react';
import { Link, browserHistory, withRouter } from 'react-router';

class Header extends Component {
  constructor(props) {
    super(props);
  }

  renderLinks() {
    if (this.props.currentUser) {
      return(
        <ul className="nav navbar-nav navbar-right">
          <li><Link to="/">Home</Link></li>
          <li><Link to="/preference">Preference</Link></li>
          <li><Link to="/schedule">Schedule</Link></li>
          <li><Link to="/subs">Subs</Link></li>
          <li><Link to="/logout">Logout</Link></li>
        </ul>
      )
    } else {
      return(
        <ul className="nav navbar-nav navbar-right">
          <li><Link to="/signup">Sign up</Link></li>
          <li><Link to="/login">Login</Link></li>
        </ul>
      )
    }
  }

  render() {
    return (
      <nav className="navbar navbar-default navbar-static-top" ref="header">
        <div className="container-fluid">
          <div className="navbar-header">
            <Link className="navbar-brand" to="/">
              <h1>CafeHub</h1>
            </Link>
          </div>
        </div>
        <div className="container-fluid">
          <div id="navbar" className="navbar-collapse collapse">
            { this.renderLinks() }
          </div>
        </div>
      </nav>
    );
  }
}

export default withRouter(Header);
