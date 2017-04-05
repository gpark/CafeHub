import React, { Component } from 'react';
import { withRouter } from 'react-router';
import HeaderContainer from './layout/header/header_container';
import FooterContainer from './layout/footer/footer_container';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div className="app-container">
        <HeaderContainer />
        <div className="app-body">
          <div className="app-content">
            { this.props.children }
          </div>
        </div>
        <FooterContainer />
      </div>
    );
  }
}

export default withRouter(App);
