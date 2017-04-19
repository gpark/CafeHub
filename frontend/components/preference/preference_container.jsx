import { connect } from 'react-redux';
import Preference from './preference';
import { fetchPreferences, setPreferences } from '../../actions/preference_actions';

const mapStateToProps = ({ session }) => ({
  preference: preferences.userPreference
});

const mapDispatchToProps = dispatch => ({
  fetchPreference: () => dispatch(fetchPreference()),
  setPreference: preference => dispatch(setPreference(preference))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Preference);
