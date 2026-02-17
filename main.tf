resource "proxmox_vm_qemu" "test_vm" {
  name        = "tf-test-01"
  target_node = "pve1"
  clone       = "ubuntu-cloudinit-template"

  cores   = 2
  memory  = 2048
  scsihw  = "virtio-scsi-pci"
  onboot  = true

  disk {
    size    = "10G"
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ciuser  = "ubuntu"
  sshkeys = file("~/.ssh/id_ed25519.pub")
}

