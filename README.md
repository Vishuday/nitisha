# Jarvis

WARNING: Work in progress
---
The model diagram below highlights the general state of what models are included. However many of them have the bare minimum functionality. You can see the `docs/models_complete.svg` image for a more complete picture of what is included. Most models have only enough information on them to make them all link up so very little data beyond absolute basics are included at this time. Please feel free to add to the models and send pull requests.

At the time of writing all the models in the diagram below have working endpoints on the REST API at least.

# About

Jarvis is a fairly simple REST API inventorying system.

It was inspired by Netdot but does not implement the same quantity of
functionality.

It focuses mainly on devices and how they connect both physically
(through cables) and their IP addresses.

It does not for example contain the same DNS functionality as Netdot.
This could however be added as a consumer of Jarvis' REST API.

Jarvis is a pure REST API each object is represented through the usual GET/POST/PUT/DELETE methods.

## Basic data structure
<img src="https://rawgit.com/Afterglow/jarvis/master/doc/models_brief.svg" width="600" />

The core of the data model is the `device`. This is a switch, or a server or
some other piece of equipment.

Devices have an associated `Asset` as well as a `Devicetype`
(e.g. Server or Switch). They also have a `Location`.

Finally devices can have one or more `Ports`. These allow it to connect to other
devices with `Connections`, and also provide for the addition of `Interfaces` which have `Ipaddresses`.

Ports connect to other ports through a `Cabletype` and validators assert that
the `Connectortype` at each end of the cabletype match the respective
`Connectortype` of the `Porttype` of the ports being connected.

## Running Jarvis as a demo
If you want to see the Jarvis API working with some prepopulated data then you
start up the service using the built in rails server and the test fixture data.
Assuming a working Ruby environment...

    > bundle install
    > rake db:migrate
    > rake db:fixtures:load
    > bin/rails server

This should start the API on http://localhost:3000 assuming everything has worked. From here you can make some test queries to see it working.

    > curl http://localhost:3000/api/v1/devices.json

```json
{"devices":[
  {
    "name":"Test Computer",
    "description":null,
    "devicetype": {
      "id":443405815,
      "name":"server",
      "created_at":"2015-06-23T15:02:35.000Z",
      "updated_at":"2015-06-23T15:02:35.000Z"
    },
    "asset":{
      "id":551884710,
      "serial":"1",
      "description":null,
      "created_at":"2015-06-23T15:02:35.000Z",
      "updated_at":"2015-06-23T15:02:35.000Z"
    },
    "location":null
  },
  {
    "name":"Test Computer 2",
    "description":null,
    "devicetype": {
      "id":443405815,
      "name":"server",
      "created_at":"2015-06-23T15:02:35.000Z",
      "updated_at":"2015-06-23T15:02:35.000Z"
    },
    "asset": {
      "id":971785762,
      "serial":"2",
      "description":null,
      "created_at":"2015-06-23T15:02:35.000Z",
      "updated_at":"2015-06-23T15:02:35.000Z"
    },
  "location":null
  }
]}
```

# Author

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Paul Thomas (<paul+github@paulthomas.eu>)
| **Copyright:**       | Copyright (c) 2015 Paul Thomas
| **License:**         | GNU General Public License V3

# License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
