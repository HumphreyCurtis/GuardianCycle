import React from 'react';
import { Alert, AlertTitle } from '@material-ui/lab';

class AlrtIncident extends React.Component {
	render () {
	if (this.props.time != null) {
		if (this.props.incident === false) {
				return (<Alert severity="info">
					<AlertTitle>Location:</AlertTitle>
					Time: {this.props.time}<br />
					Name: {this.props.name}<br />
					Lat: {this.props.lat} &#92; Long: {this.props.long} </Alert>);
		} else {
				return (<Alert severity="error">
					<AlertTitle>Incident Location:</AlertTitle>
					Time: {this.props.time}<br />
					Name: {this.props.name}<br />
					Lat: {this.props.lat} &#92; Long: {this.props.long} </Alert>);
			}
	}
		return (<Alert severity="info">No location data found.</Alert>);
	}
}


export default AlrtIncident;
