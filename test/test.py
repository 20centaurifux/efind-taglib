"""
	project............: efind-taglib
	description........: efind-taglib test suite.
	copyright..........: Sebastian Fedrau

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License v3 as published by
	the Free Software Foundation.

	This program is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
	General Public License v3 for more details.
"""
import subprocess, os, random, string

def test_search(argv, expected, success=True):
	cmd = ["efind", "test-data"] + argv

	print("Running efind, argv=[%s]" % ", ".join(cmd[1:]))

	proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	result = filter(lambda l: l != "", str(proc.stdout.read()).split("\n"))
	proc.wait()

	if not expected is None:
		assert(set(result) == set(expected))

	assert((success and proc.returncode == 0) or (not success and proc.returncode != 0))

def random_string(length=32):
	return "".join(random.choice(string.ascii_uppercase + string.digits) for _ in range(length))

SEARCH_ARGS = [[['type=file and audio_length()=90 or audio_bitrate()<100'],["test-data/pink90.mp3", "test-data/sinus30.ogg"]],
               [['type=file and audio_length()>5'], ["test-data/pink90.mp3", "test-data/sinus30.ogg", "test-data/square45.flac"]],
               [['type=file and artist_matches("foo")'], ["test-data/pink90.mp3", "test-data/pink5.mp3"]],
               [['type=file and genre_matches("noise") and audio_samplerate()=48000'], ["test-data/pink90.mp3", "test-data/pink5.mp3", "test-data/square45.flac"]],
               [['type=file and audio_channels()=1'], ["test-data/pink90.mp3", "test-data/pink5.mp3", "test-data/sinus30.ogg", "test-data/chirp.wav", "test-data/square45.flac"]],
               [['type=file and title_equals("pink 90")'], ["test-data/pink90.mp3"]]]

INVALID_SEARCH_ARGS = [['readable and title_equals(" ) and audio_bitrate()>5'],
                       [random_string(1024)],
                       ['writable or album_equals("%s")' % (random_string(2048))]]

if __name__ == "__main__":
	for argv, expected in SEARCH_ARGS:
		test_search(argv, expected)

	for argv in INVALID_SEARCH_ARGS:
		test_search(argv, None, False)
