#!/bin/sh

kubectl create secret generic gitlab-license -n gitlab \
	--from-file=license
