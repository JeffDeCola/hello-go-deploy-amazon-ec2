#!/bin/bash
# hello-go-deploy-aws set-pipeline.sh

fly -t ci set-pipeline -p hello-go-deploy-aws -c pipeline.yml --load-vars-from ../../../../../.credentials.yml
