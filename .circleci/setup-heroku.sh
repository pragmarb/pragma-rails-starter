#!/bin/bash
git remote add heroku-dev git@heroku.com:my-app.git
git remote add heroku-staging git@heroku.com:my-app.git
git remote add heroku-production git@heroku.com:my-app.git

cat >> ~/.ssh/config << EOF
  VerifyHostKeyDNS yes
  StrictHostKeyChecking no
EOF
