#!/bin/bash
# hello-go-deploy-aws destroy-pipeline.sh

fly -t ci destroy-pipeline --pipeline hello-go-deploy-aws
