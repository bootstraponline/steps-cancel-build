#!/bin/bash
set -euxo pipefail

curl -X POST \
  https://api.bitrise.io/v0.1/apps/$BITRISE_APP_SLUG/builds/$BITRISE_BUILD_SLUG/abort \
  -H "authorization: token $BITRISE_TOKEN" \
  -H 'content-type: application/json; charset=UTF-8' \
  -d '{
  "abort_reason": "Build cancelled.",
    "skip_notifications": true,
    "abort_with_success": true
}'

# wait for build to be cancelled
sleep 60
