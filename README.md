# Personal Ansible Playbook

This is my personal Ansible playbook for setting up my development environment. It is a work in progress and will be updated as I learn more about Ansible and as my needs change.

## Usage

To run the playbook, use the following command:

```bash
git clone https://github.com/alexguillamon/ansible.git && ./ansible/install_macos.sh
```

This will clone the repository and run the `install_macos.sh` script, which will install Ansible and run the playbook.

## TODOS:

- [ ] Add error handling to not crash the script
- [ ] make sure that the script is idempotent
- [ ] make fnm install manual so that you can manage your own zshrc file
- [ ] Add instructions on extra setup of each app
- [ ] find a way to install pnpm in the same run as fnm
- [ ] add set up touch id
- [ ] fix karibiner setup
