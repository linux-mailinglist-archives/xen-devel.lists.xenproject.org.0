Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4719AF67A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 03:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825609.1239882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t48pn-0004f5-Tm; Fri, 25 Oct 2024 01:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825609.1239882; Fri, 25 Oct 2024 01:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t48pn-0004d0-Pt; Fri, 25 Oct 2024 01:09:47 +0000
Received: by outflank-mailman (input) for mailman id 825609;
 Fri, 25 Oct 2024 01:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=daqB=RV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t48pm-0004cu-2I
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 01:09:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d15b8350-926d-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 03:09:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44BEE5C4D36;
 Fri, 25 Oct 2024 01:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F655C4CEC7;
 Fri, 25 Oct 2024 01:09:40 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d15b8350-926d-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729818582;
	bh=XMD6Ta3t2xnLpwhbrhrvJFF2hfUvFl1uw+ZejnvQoaY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g0P5QlnG0+ZGKluKugLh8C1uvhAudKLIwDcS5c7h/na6QC3trhMhHAr5UMqCxtNG8
	 AubO2N5AG1jQLWDyeUbAsUTdeznsAZqZbXDkZG9U+9IDQAgK14JpUHwIM5xYz/wjjc
	 YzBlMEw57gBzB5Kgxy5B/dGGdO/QcxgH0aK22K9H+qNvxTLgXBh7TM4DAptm50PMMP
	 oVFxeLGsIWQE67u4+sD85mx5DEvlmMefQzreN/40aTqX5yDQKIQdKIhn34VONaOhcM
	 Dz4Gh5eTmnPoREBSGiREU6E7K58E3hcS+5Qi5W5fDAnIxoBoDP8z6hNwvlzdanikmT
	 kFpl6FoK3lJbw==
Date: Thu, 24 Oct 2024 18:09:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [TEST_ARTIFACTS PATCH v1 1/1] build: add x86_64 xen artifacts
 (argo)
In-Reply-To: <3161fa3f955cda2d3c968d18c8afcc38316323bf.1729809799.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410241808120.2264989@ubuntu-linux-20-04-desktop>
References: <cover.1729809799.git.victorm.lira@amd.com> <3161fa3f955cda2d3c968d18c8afcc38316323bf.1729809799.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2027405872-1729818582=:2264989"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2027405872-1729818582=:2264989
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 24 Oct 2024, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Add container image build files:
> - alpine/x86_64-build
> - alpine/x86_64-rootfs
> - Makefile
> 
> Add CI configuration and jobs to produce binaries for xen tests:
> - xen-argo          Linux Xen Argo kernel module
> - bzImage           Linux kernel
> - libargo           Linux Argo shared library
> - argo-exec         Linux Argo test program
> - initrd.tar.gz     Alpine Linux rootfs
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

One comment below

> ---
> Changes v1:
> - Update dockerfile format to group dependencies
> - add user to build container
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .gitlab-ci.yml                         | 50 ++++++++++++++++++++
>  binaries/.gitignore                    |  3 ++
>  images/Makefile                        | 20 ++++++++
>  images/alpine/x86_64-build.dockerfile  | 31 +++++++++++++
>  images/alpine/x86_64-rootfs.dockerfile |  4 ++
>  scripts/x86_64-argo-linux.sh           | 63 ++++++++++++++++++++++++++
>  scripts/x86_64-kernel-linux.sh         | 31 +++++++++++++
>  scripts/x86_64-rootfs-alpine.sh        | 58 ++++++++++++++++++++++++
>  8 files changed, 260 insertions(+)
>  create mode 100644 .gitlab-ci.yml
>  create mode 100644 binaries/.gitignore
>  create mode 100644 images/Makefile
>  create mode 100644 images/alpine/x86_64-build.dockerfile
>  create mode 100644 images/alpine/x86_64-rootfs.dockerfile
>  create mode 100755 scripts/x86_64-argo-linux.sh
>  create mode 100755 scripts/x86_64-kernel-linux.sh
>  create mode 100755 scripts/x86_64-rootfs-alpine.sh
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> new file mode 100644
> index 0000000..7e18a87
> --- /dev/null
> +++ b/.gitlab-ci.yml
> @@ -0,0 +1,50 @@
> +workflow:
> +  name: "xen test artifacts"
> +
> +.artifacts:
> +  stage: build
> +  image:
> +    name: registry.gitlab.com/xen-project/hardware/test-artifacts/${CONTAINER}
> +  artifacts:
> +    name: "${CI_JOB_NAME_SLUG}"
> +    paths:
> +      - binaries/
> +    exclude:
> +      - binaries/.gitignore
> +
> +.x86_64-artifacts:
> +  extends: .artifacts
> +  image:
> +    docker:
> +      platform: linux/amd64
> +      user: xenproject
> +  tags:
> +    - x86_64
> +  variables:
> +    CONTAINER: alpine:x86_64-build
> +
> +x86_64-kernel-linux-6.6.56:
> +  extends: .x86_64-artifacts
> +  script:
> +    - . scripts/x86_64-kernel-linux.sh
> +  variables:
> +    LINUX_VERSION: 6.6.56
> +
> +x86_64-rootfs-alpine-3.18:
> +  extends: .x86_64-artifacts
> +  image:
> +    docker:
> +      user: root
> +  script:
> +    - . scripts/x86_64-rootfs-alpine.sh
> +  variables:
> +    CONTAINER: alpine:x86_64-rootfs
> +
> +x86_64-argo-linux-6.6.56:
> +  extends: .x86_64-artifacts
> +  script:
> +    - . scripts/x86_64-argo-linux.sh
> +  variables:
> +    LINUX_VERSION: 6.6.56
> +    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
> +    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
> diff --git a/binaries/.gitignore b/binaries/.gitignore
> new file mode 100644
> index 0000000..95e2a2e
> --- /dev/null
> +++ b/binaries/.gitignore
> @@ -0,0 +1,3 @@
> +# Keep this directory around to be available in CI/CD jobs.
> +*
> +!.gitignore
> diff --git a/images/Makefile b/images/Makefile
> new file mode 100644
> index 0000000..42f231b
> --- /dev/null
> +++ b/images/Makefile
> @@ -0,0 +1,20 @@
> +
> +# The base of where these containers will appear
> +REGISTRY := registry.gitlab.com/xen-project/hardware/test-artifacts
> +CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
> +
> +help:
> +	@echo "Containers to build test artifacts."
> +	@echo "To build one run 'make DISTRO/TAG'."
> +	@echo "Available containers:"
> +	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
> +	@echo "To push container builds, set the environment variable PUSH"
> +
> +%: %.dockerfile ## Builds containers
> +	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
> +	@if [ ! -z $${PUSH+x} ]; then \
> +		docker push $(REGISTRY)/$(@D):$(@F); \
> +	fi
> +
> +.PHONY: all
> +all: $(CONTAINERS)
> diff --git a/images/alpine/x86_64-build.dockerfile b/images/alpine/x86_64-build.dockerfile
> new file mode 100644
> index 0000000..3bfd172
> --- /dev/null
> +++ b/images/alpine/x86_64-build.dockerfile
> @@ -0,0 +1,31 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 alpine:3.18
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +WORKDIR /build/
> +
> +RUN apk --no-cache add bash
> +
> +RUN bash -ex <<EOF
> +      adduser -D xenproject --shell bash
> +
> +      DEPS=(
> +            musl-dev
> +            build-base
> +            libc6-compat
> +            linux-headers
> +            bash
> +            git
> +            curl
> +            flex
> +            bison
> +            elfutils-dev
> +            autoconf
> +            automake
> +            libtool
> +            openssl-dev
> +      )
> +
> +      apk add --no-cache "\${DEPS[@]}"
> +EOF
> diff --git a/images/alpine/x86_64-rootfs.dockerfile b/images/alpine/x86_64-rootfs.dockerfile
> new file mode 100644
> index 0000000..b912e9c
> --- /dev/null
> +++ b/images/alpine/x86_64-rootfs.dockerfile
> @@ -0,0 +1,4 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 alpine:3.18
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> diff --git a/scripts/x86_64-argo-linux.sh b/scripts/x86_64-argo-linux.sh
> new file mode 100755
> index 0000000..a110a33
> --- /dev/null
> +++ b/scripts/x86_64-argo-linux.sh
> @@ -0,0 +1,63 @@
> +#!/usr/bin/env bash
> +
> +if test -z "${LINUX_VERSION}"
> +then
> +    >&2 echo "LINUX_VERSION must be set"; exit 1
> +fi
> +
> +set -ex -o pipefail
> +
> +BUILDDIR="${PWD}"
> +COPYDIR="${BUILDDIR}/binaries/"
> +
> +# Prepare Linux sources
> +curl -fsSLO \
> +    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
> +tar xJf linux-"${LINUX_VERSION}".tar.xz
> +cd linux-"${LINUX_VERSION}"
> +make ARCH=x86 defconfig
> +make ARCH=x86 xen.config
> +./scripts/config --enable BRIDGE
> +./scripts/config --enable IGC
> +./scripts/config --enable TUN
> +cp .config .config.orig
> +cat .config.orig \
> +    | grep 'XEN' \
> +    | grep '=m' \
> +    | sed 's/=m/=y/g' \
> +    >> .config
> +make ARCH=x86 olddefconfig
> +make ARCH=x86 modules_prepare
> +
> +# Build Linux kernel module for Xen Argo
> +cd "${BUILDDIR}"
> +git clone \
> +    --depth=1 --branch=master \
> +    https://github.com/OpenXT/linux-xen-argo.git
> +git -C "${BUILDDIR}/linux-xen-argo" switch --detach "${ARGO_SHA}"
> +make -C "linux-${LINUX_VERSION}" M="${BUILDDIR}/linux-xen-argo/argo-linux" \
> +    CFLAGS_MODULE="-Wno-error" KBUILD_MODPOST_WARN=1
> +cp "linux-xen-argo/argo-linux/xen-argo.ko" "${COPYDIR}/xen-argo.ko"
> +
> +# Build Linux libargo shared library, applying fixes to build in Alpine Linux
> +cd "${BUILDDIR}/linux-xen-argo/libargo"
> +sed -i "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" configure.ac
> +sed -i "s/__SOCKADDR_COMMON (sxenargo_)/sa_family_t sxenargo_family/" src/libargo.h
> +sed -i "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" src/libargo.h
> +autoreconf --install
> +./configure --prefix="${COPYDIR}" CPPFLAGS="-I${PWD}/../argo-linux/include"
> +make
> +make install
> +
> +# Build Linux user program, modifying for xilinx argo test
> +cd "${BUILDDIR}"
> +wget "https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/\
> +recipes-openxt/argo-exec/argo-exec/argo-exec.c"
> +sed -i "s|#include <xen/xen.h>||" argo-exec.c
> +sed -i "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" \
> +    argo-exec.c

Normally I would suggest to handle this as a patch file but given it is
just 2 changes, and it is nice to have everything contained within this
file, I think it is OK. In the future if we grow more changes, I'd
suggest to move it out.


> +gcc -I"${BUILDDIR}/linux-xen-argo/libargo/src" \
> +    -I"${BUILDDIR}/linux-xen-argo/argo-linux/include" \
> +    -L"${COPYDIR}/lib/" \
> +    -o argo-exec argo-exec.c -largo
> +cp argo-exec "${COPYDIR}"
> diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux.sh
> new file mode 100755
> index 0000000..2a816f0
> --- /dev/null
> +++ b/scripts/x86_64-kernel-linux.sh
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env bash
> +
> +if test -z "${LINUX_VERSION}"
> +then
> +    >&2 echo "LINUX_VERSION must be set"; exit 1
> +fi
> +
> +set -ex -o pipefail
> +
> +WORKDIR="${PWD}"
> +COPYDIR="${WORKDIR}/binaries/"
> +
> +# Build Linux
> +curl -fsSLO \
> +    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
> +tar xJf linux-"${LINUX_VERSION}".tar.xz
> +cd linux-"${LINUX_VERSION}"
> +make ARCH=x86 defconfig
> +make ARCH=x86 xen.config
> +./scripts/config --enable BRIDGE
> +./scripts/config --enable IGC
> +./scripts/config --enable TUN
> +cp .config .config.orig
> +cat .config.orig \
> +    | grep 'XEN' \
> +    | grep '=m' \
> +    | sed 's/=m/=y/g' \
> +    >> .config
> +make ARCH=x86 olddefconfig
> +make -s -j "$(nproc)" ARCH=x86
> +cp arch/x86/boot/bzImage "${COPYDIR}"
> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
> new file mode 100755
> index 0000000..28d8e30
> --- /dev/null
> +++ b/scripts/x86_64-rootfs-alpine.sh
> @@ -0,0 +1,58 @@
> +WORKDIR="${PWD}"
> +
> +apk update
> +
> +# xen runtime deps
> +apk add musl
> +apk add libgcc
> +apk add openrc
> +apk add busybox
> +apk add sudo
> +apk add dbus
> +apk add bash
> +apk add python3
> +apk add zlib
> +apk add ncurses
> +apk add yajl
> +apk add libaio
> +apk add xz
> +apk add util-linux
> +apk add argp-standalone
> +apk add libfdt
> +apk add glib
> +apk add pixman
> +apk add curl
> +apk add udev
> +apk add pciutils
> +apk add libelf
> +
> +# Xen
> +cd /
> +# Minimal ramdisk environment in case of cpio output
> +rc-update add udev
> +rc-update add udev-trigger
> +rc-update add udev-settle
> +rc-update add loopback sysinit
> +rc-update add bootmisc boot
> +rc-update add devfs sysinit
> +rc-update add dmesg sysinit
> +rc-update add hostname boot
> +rc-update add hwclock boot
> +rc-update add hwdrivers sysinit
> +rc-update add modules boot
> +rc-update add killprocs shutdown
> +rc-update add mount-ro shutdown
> +rc-update add savecache shutdown
> +rc-update add local default
> +cp -a /sbin/init /init
> +echo "ttyS0" >> /etc/securetty
> +echo "hvc0" >> /etc/securetty
> +echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
> +echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
> +echo > /etc/modules
> +passwd -d "root" root
> +
> +# Create rootfs
> +cd /
> +tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
> +    bin dev etc home init lib mnt opt root sbin usr var
> --
> 2.25.1
> 
--8323329-2027405872-1729818582=:2264989--

