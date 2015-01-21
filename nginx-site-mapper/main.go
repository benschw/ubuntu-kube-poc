package main

import (
	"bufio"
	"flag"
	"html/template"
	"log"
	"os"
	"strings"
	"time"
)

type Mapping struct {
	Host string
	Ip   string
	Port string
}

func writeSiteConfig(mapping *Mapping, outputPath string, tplPath string) error {
	t, err := template.ParseFiles(tplPath)
	if err != nil {
		return err
	}

	// open output file
	fo, err := os.Create(outputPath + mapping.Host + ".conf")
	if err != nil {
		return err
	}
	// close fo on exit and check for its returned error
	defer func() {
		if err := fo.Close(); err != nil {
			panic(err)
		}
	}()
	// make a write buffer
	w := bufio.NewWriter(fo)

	t.Execute(w, mapping)
	if err = w.Flush(); err != nil {
		return err
	}

	return nil
}

const HostSubstr = "_SERVICE_HOST"
const PortSubstr = "_SERVICE_PORT"

func getMappers() (map[string]*Mapping, error) {
	mappings := make(map[string]*Mapping)
	for _, e := range os.Environ() {
		pair := strings.Split(e, "=")
		if len(pair[0]) > len(HostSubstr) {
			l := len(pair[0]) - len(HostSubstr)
			if pair[0][l:] == HostSubstr {
				name := pair[0][0:l]
				mappings[strings.ToLower(name)] = &Mapping{
					Host: strings.ToLower(name) + ".local",
					Ip:   os.Getenv(name + HostSubstr),
					Port: os.Getenv(name + PortSubstr),
				}

			}
		}
	}
	return mappings, nil
}

func main() {
	var outputPath = flag.String("o", "/opt/sites/", "output path")
	var tplPath = flag.String("t", "/opt/site.tpl", "tpl path")

	flag.Parse()
	// os.Setenv("DEMO_SERVICE_HOST", "192.12.12.12")
	// os.Setenv("DEMO_SERVICE_PORT", "8080")
	// os.Setenv("BAR_SERVICE_HOST", "192.12.12.12")
	// os.Setenv("BAR_SERVICE_PORT", "8080")
	log.Println("starting")

	index := make(map[string]*Mapping)

	for true {

		mappings, err := getMappers()
		if err != nil {
			log.Println(err)
		}

		for key, mapping := range mappings {
			modified := false
			if _, ok := index[key]; ok {
				if index[key].Ip != mapping.Ip || index[key].Port != mapping.Port {
					modified = true
				}
			} else {
				modified = true
			}
			if modified {
				log.Println("updating: " + key)
				if err := writeSiteConfig(mapping, *outputPath, *tplPath); err != nil {
					log.Println(err)
				}
			}
			index[key] = mapping
		}

		time.Sleep(5 * 1000 * time.Millisecond)
	}
	// mapping := &Mapping{Host: "foo.local", Ip: "172.20.20.10", Port: "8080"}

	// if err := writeSiteConfig(mapping, *outputPath); err != nil {
	// 	panic(err)
	// }
}

// KUBERNETES_RO_PORT=tcp://11.1.1.210:80
// DEMO_SERVICE_HOST=11.1.1.23
// DEMO_SERVICE_PORT=80
// DEMO_PORT=tcp://11.1.1.23:80
// DEMO_PORT_80_TCP_PORT=80
// DEMO_PORT_80_TCP_PROTO=tcp
// DEMO_PORT_80_TCP_ADDR=11.1.1.23
// DEMO_PORT_80_TCP=tcp://11.1.1.23:80
// KUBERNETES_RO_SERVICE_HOST=11.1.1.210
// HOSTNAME=3b45afcb-a0f2-11e4-8ea5-080027fdae7c
// KUBERNETES_PORT_443_TCP_PORT=443
// KUBERNETES_PORT=tcp://11.1.1.151:443
// KUBERNETES_RO_SERVICE_PORT=80
// KUBERNETES_SERVICE_PORT=443
// KUBERNETES_RO_PORT_80_TCP_PORT=80
// KUBERNETES_SERVICE_HOST=11.1.1.151
// KUBERNETES_RO_PORT_80_TCP_PROTO=tcp
// PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
// PWD=/
// KUBERNETES_RO_PORT_80_TCP_ADDR=11.1.1.210
// SHLVL=1
// HOME=/root
// KUBERNETES_RO_PORT_80_TCP=tcp://11.1.1.210:80
// KUBERNETES_PORT_443_TCP_PROTO=tcp
// KUBERNETES_PORT_443_TCP_ADDR=11.1.1.151
// KUBERNETES_PORT_443_TCP=tcp://11.1.1.151:443
