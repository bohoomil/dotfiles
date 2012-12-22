#!/bin/bash

uptime | sed 's/.*up \(.*\),.*user.*/\1/'

