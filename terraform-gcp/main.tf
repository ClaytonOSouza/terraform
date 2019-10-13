# Configura o projeto GCP
provider "google" {
  credentials = "${file("black-obelisk-253402-2b1750456a3d.json")}"
  project     = "${var.projeto-nginx}"
  region      = "${var.regiao}"
}

# Cria a VM com o Google Compute Engine
resource "google_compute_instance" "webserver" {
  name          = "${var.nome}"
  machine_type  = "${var.tipo_maquina}"
  zone          = "${var.zona}"

  boot_disk {
    initialize_params {
      image = "${var.imagem}"
    }
  }

  # Instala o servidor web Apache
  metadata_startup_script = "sudo apt-get update; sudo apt-get install apache2 -y; echo Testando > /var/www/html/index.html"

  # Habilita rede para a VM bem como um IP público
  network_interface {
    network = "default"
    access_config {

    }
  }
}
