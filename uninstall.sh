#!/bin/bash

export APP_NAME=$1

helm delete $APP_NAME --purge
