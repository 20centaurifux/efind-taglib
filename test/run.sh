#!/bin/bash
#
#  efind-taglib test suite.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License v3 as published by
#  the Free Software Foundation.
#
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#  General Public License v3 for more details.

PYTHON=/usr/bin/python2

generate_test_files()
{
	echo "Generating test files."

	dd if=/dev/urandom of=test-data/rnd-5M.foo bs=1M count=5
	dd if=/dev/urandom of=test-data/rnd-2M.bar bs=1M count=2
	dd if=/dev/urandom of=test-data/rnd-8M.baz bs=1M count=8
}

run_test()
{
	# run Python script:
	echo "Running test suite."
        $PYTHON ./test.py
}

cleanup()
{
	# delete generated test files:
	echo "Deleting test files."
	rm -fr ./test-data/rnd*
}

generate_test_files && run_test && cleanup
