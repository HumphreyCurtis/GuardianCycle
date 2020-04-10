import React from 'react';
import ReactDOM from 'react-dom';
import SignInSide from './pages/SignInSide';

class Application extends React.Component {
render() {
	return (
	<SignInSide />
	);
}
}
ReactDOM.render(<Application />, document.getElementById('app'));

