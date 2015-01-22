package main

import (
	"os"
)

func stringInSlice(a string, list []string) bool {
	for _, b := range list {
		if b == a {
			return true
		}
	}
	return false
}

func deleteConfig(name string, path string) error {

	return os.Remove(path + name + ".local.conf")
}
