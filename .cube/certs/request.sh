#!/bin/bash

HOST=$1

~/.acme.sh/acme.sh --issue -d "$HOST" --stateless
