#!/bin/bash
drone exec --debug --cache --deploy --notify --yaml .ci/.drone.yml -E .ci/secrets.yml
