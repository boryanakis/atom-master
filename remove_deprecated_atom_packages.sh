#!/usr/bin/env bash

while read PACKAGE; do
  apm uninstall ${PACKAGE}
done <${1}
