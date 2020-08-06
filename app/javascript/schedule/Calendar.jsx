import React from 'react'
import faker from 'faker'
import axios from 'axios'

const csrfToken = document.querySelector('[name="csrf-token"').content
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

export default function Calendar(props) {
	return (
		<div id="calendarContainer">
			<h1>{faker.name.firstName()}</h1>
		</div>
	);
}

// View mode state user/manager
// Has many weeks depending on state
// Has one day depending on state
// Store preference in user