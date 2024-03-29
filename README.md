# Proxmox Mail Gateway + Ikarus

> Proxmox Mail Gateway Custom Check Interface for the Ikarus Server. <br> (license is required)

## Info

For use cases which are not handled by the Proxmox Mail Gateway Virus Detector andSpamAssassin™configuration, advanced users can create a custom check executable which, if enabled will be called beforethe Virus Detector and before passing an e-mail through the Rule System. The custom check API is keptas simple as possible, while still providing a great deal of control over the treatment of an e-mail.

[↳ admin guid](https://pmg.proxmox.com/pmg-docs/pmg-admin-guide.html#pmgconfig_custom_check)

[Packages / Scripts + Quick Start Guide](https://fx.ikarus.at/scan.server/)

## server

> ikarus-scanserver-1.7.2_amd64.deb [download](https://fx.ikarus.at/scan.server/)

### working

- Ubuntu 20.04 (Desktop) [VirtualBox]
- Debain 10 (Server) [VirtualBox]

### error

- ubuntu:2004 [Docker]
- debain:stable [Docker]

```bash
[18.08.2021 13:31:24] Remote-Manager[127.0.0.1]: ImportLicense 127.0.0.1: Unexpected initial response ''
Error: Could not import license file
```

## access

`http://IP:80/virusscan`

## test STDERR (E) / STDOUT (O)

> annotate-output ./post.sh -n

```bash
annotate-output ./run.sh -n
16:12:48 I: Started ./post.sh -n
16:12:53 E: curl: (28) Connection timed out after 5000 milliseconds
16:12:53 O: EMPTY
16:12:53 I: Finished with exitcode 1
```
