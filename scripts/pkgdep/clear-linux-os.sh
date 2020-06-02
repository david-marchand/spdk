#!/usr/bin/env bash

# Install main dependencies
swupd bundle-add -y c-basic make dev-utils openssl devpkg-libiscsi \
	devpkg-ncurses python3-basic python-extras devpkg-open-iscsi \
	jq storage-utils
# Additional dependencies for ISA-L used in compression
swupd bundle-add -y dev-utils-dev
# Additional dependencies for DPDK
swupd bundle-add -y nasm sysadmin-basic
if [[ $INSTALL_DEV_TOOLS == "true" ]]; then
	swupd bundle-add -y git os-testsuite-0day
	install_shfmt
fi
if [[ $INSTALL_PMEM == "true" ]]; then
	# Additional dependencies for building pmem based backends
	swupd bundle-add -y devpkg-pmdk
fi
if [[ $INSTALL_FUSE == "true" ]]; then
	# Additional dependencies for FUSE and NVMe-CUSE
	swupd bundle-add -y devpkg-fuse
fi
if [[ $INSTALL_RDMA == "true" ]]; then
	# Additional dependencies for RDMA transport in NVMe over Fabrics
	swupd bundle-add -y devpkg-rdma-core network-basic-dev
fi
if [[ $INSTALL_DOCS == "true" ]]; then
	# Additional dependencies for building docs
	swupd bundle-add -y doxygen graphviz
fi