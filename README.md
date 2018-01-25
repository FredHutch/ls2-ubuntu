# ls2_ubuntu

Please see [ls2](https://github.com/FredHutch/ls2) for full docs.

This container does the following:

* freeze official Ubuntu containers so packages remain the same
* install some base OS packages
* harvest package information for repo
* add the LS2 user

## Build instructions

* Options that can be set with `--build-arg <ARG>=<VAL>`:
  * `LS2_USERNAME` Default: `neo`
  * `LS2_UID` Default: `500` (this lines up with ec2_user)
  * `LS2_GROUPNAME` Default: `neo`
  * `LS2_GID` Default: `500`
  * `DEPLOY_PREFIX` Default: `/app`

The DEPLOY_PREFIX is where 
