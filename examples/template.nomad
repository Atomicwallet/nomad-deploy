job {{ NOMAD_ID }} {
  region = "{{ REGION }}"
  datacenters = [ "{{ DC }}" ]
  type = "service"

  update {
    healthy_deadline = "10m"
    progress_deadline = "0"
  }

  group "contrib" {
    count = 1

    task "es" {
      driver = "docker"

      config {
        image = "{{ IMAGE }}"
        force_pull = true

        ulimit {
          memlock = "-1"
          nofile = "65536"
          nproc = "8192"
        }
      }

      env {
        "ES_JAVA_OPTS" = "-Xms1024m -Xmx1024m"
        "bootstrap.memory_lock" = "true"
      }

      service {
        port = "es"

        check {
          type = "tcp"
          interval = "10s"
          timeout = "2s"
        }
      }

      resources {
        cpu = 500
        memory = 2048

        network {
          port "es" {
              static = 9200
          }
        }
      }
    }
  }
}
