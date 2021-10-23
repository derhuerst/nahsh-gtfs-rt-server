'use strict'

const {
	normalizeStopName,
	normalizeLineName,
} = require('./normalize')

const hafasInfo = {
	endpointName: 'nahsh-hafas',
	normalizeStopName,
	normalizeLineName,
}

module.exports = hafasInfo
