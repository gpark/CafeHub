import { connect } from 'react-redux';
import { signup } from '../../../actions/session_actions';
import Signup from './signup';


const mapStateToProps = ({ session }) => ({
  currentUser: session.currentUser,
  errors: session.errors
});

const mapDispatchToProps = dispatch => {
  return {
    signup: user => dispatch(signup(user)).then((response) => {
      localStorage.setItem('sessionToken', response.currentUser.token);
    })
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Signup);
