import { connect } from 'react-redux';
import { login } from '../../../actions/session_actions';
import Login from './login';


const mapStateToProps = ({ session }) => {
  return {
    currentUser: session.currentUser,
    errors: session.errors
  }
};

const mapDispatchToProps = dispatch => {
  return {
    login: user => dispatch(login(user))
      .then((response) => {
        localStorage.setItem('sessionToken', response.currentUser.token);
      }
    )
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Login);
