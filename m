Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7B39ABD95
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 06:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824417.1238553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3TQr-0003jW-1G; Wed, 23 Oct 2024 04:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824417.1238553; Wed, 23 Oct 2024 04:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3TQq-0003hX-U8; Wed, 23 Oct 2024 04:57:16 +0000
Received: by outflank-mailman (input) for mailman id 824417;
 Wed, 23 Oct 2024 04:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7t1=RT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t3TQq-0003hR-Cr
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 04:57:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44302353-90fb-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 06:57:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 744FD5C56FA;
 Wed, 23 Oct 2024 04:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0062C4CEC6;
 Wed, 23 Oct 2024 04:57:10 +0000 (UTC)
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
X-Inumbo-ID: 44302353-90fb-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729659431;
	bh=+vuwRm6fl1Z40OFBw/Am53xkGUJOvzhYzdc3p6n7XU8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gmE7628FH4BpHzJs57gq/51Ktbc8EdH7p5JE+sfiaoC1fJruIx4rmf22ZgYt29sqI
	 vk05olThx1vFyVk8tojiAMWbKJkhKaNv0F3ONHe2UHIjLI1PEren5PCOkL9xyZIr6B
	 4gepExYwxB4Wh7lKOD83egWpAPGjycO7hRdwseW0GaBIRTzs2I0B3E6vn6HB83ptNX
	 k/y7aSBk7/7dNHqiQfgSjDLBz8TjKjbXtA8WNjEIsOf4o1U6eJ5GalLmmJNVUaMyz3
	 xbe5QhJDwR8vA6KHbI8i3zfFPrE7EmXsA9tn/oo36SyoS4V0fOB/Npvory+dmawitt
	 K7GvMFN2A/4sA==
Date: Tue, 22 Oct 2024 21:57:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC TEST_ARTIFACTS PATCH 1/2] artifacts: Initial commit
In-Reply-To: <21a6030f352282d822c30de4a1e7ecab9a8c0a99.1729649255.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410222154400.3833@ubuntu-linux-20-04-desktop>
References: <cover.1729649255.git.victorm.lira@amd.com> <21a6030f352282d822c30de4a1e7ecab9a8c0a99.1729649255.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1240544370-1729659133=:3833"
Content-ID: <alpine.DEB.2.22.394.2410222152191.3833@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1240544370-1729659133=:3833
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410222152192.3833@ubuntu-linux-20-04-desktop>

On Tue, 22 Oct 2024, victorm.lira@amd.com wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>

Hi Victor, I think this was a mistake, maybe due to the fact that I
created the repository for you. The From field represent the vauthor and
in this case it should be you.


> Create new repository to produce common artifacts for Xen tests
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .gitlab-ci.yml                         | 48 ++++++++++++++++++++
>  README.md                              | 10 ++++
>  binaries/.gitignore                    |  3 ++
>  images/Makefile                        | 20 ++++++++
>  images/alpine/x86_64-build.dockerfile  | 25 ++++++++++
>  images/alpine/x86_64-rootfs.dockerfile |  4 ++
>  scripts/x86_64-argo-linux.sh           | 63 ++++++++++++++++++++++++++
>  scripts/x86_64-kernel-linux.sh         | 31 +++++++++++++
>  scripts/x86_64-rootfs-alpine.sh        | 58 ++++++++++++++++++++++++
>  9 files changed, 262 insertions(+)
>  create mode 100644 .gitlab-ci.yml
>  create mode 100644 README.md
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
> index 0000000..f2f7738
> --- /dev/null
> +++ b/.gitlab-ci.yml
> @@ -0,0 +1,48 @@
> +workflow:
> +  name: "xen test artifacts"
> +
> +.artifacts:
> +  stage: build
> +  image:
> +    name: registry.gitlab.com/xen-project/people/victormlira/test-artifacts/${CONTAINER}

This of course needs to be changed before the series is committed


> +  artifacts:
> +    name: "${CI_JOB_NAME_SLUG}"
> +    paths:
> +      - binaries/
> +
> +.x86_64-artifacts:
> +  extends: .artifacts
> +  image:
> +    docker:
> +      platform: linux/amd64
> +      user: xenproject
> +  variables:
> +    CONTAINER: alpine:x86_64-build
> +  tags:
> +    - x86_64
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
> +  variables:
> +    CONTAINER: alpine:x86_64-rootfs
> +  image:
> +    docker:
> +      user: root
> +  script:
> +    - . scripts/x86_64-rootfs-alpine.sh
> +
> +x86_64-argo-linux-6.6.56:
> +  extends: .x86_64-artifacts
> +  script:
> +    - . scripts/x86_64-argo-linux.sh
> +  variables:
> +    LINUX_VERSION: 6.6.56
> +    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
> +    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
> diff --git a/README.md b/README.md
> new file mode 100644
> index 0000000..0d72519
> --- /dev/null
> +++ b/README.md
> @@ -0,0 +1,10 @@
> +# Xen Project Test Artifacts
> +
> +## Overview
> +
> +This repository is used to produce common artifacts for Xen tests.
> +
> +##
> +
> +
> +##
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
> index 0000000..41638d7
> --- /dev/null
> +++ b/images/Makefile
> @@ -0,0 +1,20 @@
> +
> +# The base of where these containers will appear
> +REGISTRY := registry.gitlab.com/xen-project/people/victormlira/test-artifacts

also this


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
> index 0000000..374952f
> --- /dev/null
> +++ b/images/alpine/x86_64-build.dockerfile
> @@ -0,0 +1,25 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 alpine:3.18
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +WORKDIR /build/
> +
> +RUN <<EOF
> +adduser -D xenproject
> +apk --no-cache add \
> +      musl-dev  \
> +      build-base \
> +      libc6-compat \
> +      linux-headers \
> +      bash \
> +      git \
> +      curl \
> +      flex \
> +      bison \
> +      elfutils-dev \
> +      autoconf \
> +      automake \
> +      libtool \
> +      openssl-dev


Use the DEPS variable like here to make it a bit more readable:
automation/build/fedora/40-x86_64.dockerfile


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
> +gcc -I"${BUILDDIR}/linux-xen-argo/libargo/src" \
> +    -I"${BUILDDIR}/linux-xen-argo/argo-linux/include" \
> +    -L"${COPYDIR}/lib/" \
> +    -o argo-exec argo-exec.c -largo
> +cp argo-exec "${COPYDIR}"
> diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux.sh
> new file mode 100755
> index 0000000..17be36b
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
> +make ARCH=x86 "-j$(nproc)" --quiet
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
--8323329-1240544370-1729659133=:3833--

