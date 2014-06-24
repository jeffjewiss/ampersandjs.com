PATH := node_modules/.bin:$(PATH)
SHELL := /bin/bash

STYLUS_FILES := $(shell find ./static/css -name \*.styl -print)

#All files which aren't generated by running make
HTML_SOURCE_FILES := $(shell find . -not -name "*.css" -not -name "*.html" -not -path "./node_modules/*" -not -path "./.git/*" -type f -print)


# Tasks

all: build

serve: all
	http-server . -p 8000

build: index.html static/css/main.css

index.html: $(HTML_SOURCE_FILES)
	node build.js

static/css/main.css: static/css/main.styl $(STYLUS_FILES)
	stylus -I static/css < $< > $@
