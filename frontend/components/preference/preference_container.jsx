import { connect } from 'react-redux';
import Preference from './preference';
import { fetchPreference, setPreferences } from '../../actions/preference_actions';

const mapStateToProps = ({ preference }) => ({
  preference: preference.userPreference
});

const mapDispatchToProps = dispatch => ({
  fetchPreference: () => dispatch(fetchPreference()),
  setPreference: preference => dispatch(setPreference(preference))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Preference);
