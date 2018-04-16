#!/bin/bash

function rename_things
	for f in *.pde; do
		mv $f "${f/pde/java}"
	done