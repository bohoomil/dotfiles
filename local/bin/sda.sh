#!/bin/sh

df / | awk '/^\/dev/{printf $5"\n"}'
