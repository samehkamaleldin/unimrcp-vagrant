# unimrcp-vagrant
Vagrant box that contains UniMRCP server ready and waiting

## Usage
Simply clone this repository and start the machine like the following

``` bash
git clone https://github.com/samehkamaleldin/unimrcp-vagrant.git
cd unimrcp-vagrant
vagrant up
```

## Repository structure
Repository's structure is defined as the following
``` bash
.
├── LICENSE
├── provision
│   ├── bootstrap.sh # provisioning script
│   └── environment  # environment variables file
├── README.md
└── Vagrantfile
```
## Contribution
Please feel free to fork, edit and pull request.
<br>
> Copyright (c) 2015 Sameh Kamal. Licensed under the MIT license.
