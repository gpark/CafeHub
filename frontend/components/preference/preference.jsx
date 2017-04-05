import React, { Component } from 'react';
import { Link, browserHistory, withRouter } from 'react-router';

import BigCalendar from 'react-big-calendar';
import moment from 'moment';
import events from './events';
require('react-big-calendar/lib/css/react-big-calendar.css');

BigCalendar.setLocalizer(
  BigCalendar.momentLocalizer(moment)
);

class Preference extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Preference</h1>
        <BigCalendar
          selectable
          events={events}
          defaultView='week'
          scrollToTime={new Date(1970, 1, 1, 6)}
          defaultDate={new Date(2017, 3, 10)}
          onSelectEvent={event => alert(event.title)}
          onSelectSlot={(slotInfo) => alert(
            `selected slot: \n\nstart ${slotInfo.start.toLocaleString()} ` +
            `\nend: ${slotInfo.end.toLocaleString()}`
          )}
        />
      </div>
    );
  }
}

export default withRouter(Preference);
