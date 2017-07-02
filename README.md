# efind-taglib

## Introduction

**efind-taglib** is an extension for [efind](https://github.com/20centaurifux/efind).
It makes it possible to filter find results by audio tags and properties.

You need [taglib](http://taglib.org/) to build this extension.

## Available functions

### artist\_equals(string: query)

Tests if the found artist tag equals *query*.

	$ efind . 'artist_equals("Aphex Twin")'

### album\_equals(string: query)

Tests if the found album tag equals *query*.

	$ efind . 'album_equals("Syro")'

### title\_equals(string: query)

Tests if the found title tag equals *query*.

	$ efind . 'title_equals("aisatsana [102]")'

### genre\_equals(string: query)

Tests if the found genre tag equals *query*.

	$ efind . 'genre_equals("IDM")'

### artist\_matches(string: query)

Tests if the found artist tag contains *query*. The string
comparison is case insensitive.

	$ efind . 'artist_matches("Erdball")'

### album\_matches(string: query)

Tests if the found album tag contains *query*. The string
comparison is case insensitive.

	$ efind . 'album_matches("Welt der Technik")'

### title\_matches(string: query)

Tests if the found title tag contains *query*. The string
comparison is case insensitive.

	$ efind . 'title_matches("Aggregat")'

### genre\_matches(string: query)

Tests if the found genre tag contains *query*. The string
comparison is case insensitive.

	$ efind . 'genre_matches("electro")'

### audio\_length()

Gets the audio length in seconds.

	$ efind . "audio_length()>=120"

### audio\_bitrate()

Gets the bitrate.

	$ efind . "audio_bitrate()=128"

### audio\_samplerate()

Gets the samplerate.

	$ efind . "audio_samplerate()=48000"

### audio\_channels()

Gets the number of audio channels.

	$ efind . "audio_channels()>=2"
