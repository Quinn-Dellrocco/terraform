resource "proxmox_virtual_environment_vm" "test_vm" {
  name      = "tf-test-02"
  node_name = "pve1"

  # Clone from your template VM
  clone {
    vm_id = 9000
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 10
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    user_account {
      username = "ubuntu"
      keys     = [file("~/.ssh/id_ed25519.pub")]
    }
  }
}
