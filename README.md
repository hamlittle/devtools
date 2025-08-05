# dev-setup

Scripts and other useful stuff for development environments.

# Quickstart

1. Install `rustup`.

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

2. Install `just`.

```
cargo install just
```

3. Initialize venv + Ansible.

```
just init
source venv/bin/activate
```

4. Run a thing!

```
just help
```

# Recipes

**(re)Setup an environment**

```
just install <server>
```

* Replace <server> with hostname from `inventory.yml`.
* Or, use `localhost` to run it locally.
