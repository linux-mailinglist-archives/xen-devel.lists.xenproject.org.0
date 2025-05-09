Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A84AB1FA9
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 00:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980416.1366875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVvO-0007h0-OD; Fri, 09 May 2025 22:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980416.1366875; Fri, 09 May 2025 22:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVvO-0007ds-LF; Fri, 09 May 2025 22:10:34 +0000
Received: by outflank-mailman (input) for mailman id 980416;
 Fri, 09 May 2025 22:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uDVvN-0007dm-PW
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 22:10:33 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b349ad0-2d22-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 00:10:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 32DAE438D9;
 Fri,  9 May 2025 22:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9C1C4CEE4;
 Fri,  9 May 2025 22:10:28 +0000 (UTC)
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
X-Inumbo-ID: 6b349ad0-2d22-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828629;
	bh=e+zIEXJWrAGkodXVb5WtJFAcpJfvauZZ0f5YxUeAGcM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XzQfbX1Nox8QlkSbFr444aJKNOOZdMrU+0mnuyBR4KJMmQD/Ipa4JzRg4qvwdOBWg
	 bj7Cm+oiGVwuX+mB2pDDbUdeFFy3qbQGHtjHZlTu6G9ICdpMlySmBwNBH2QS2xk8+E
	 yqdafqZfjCQNxiFUYbV2nr0LIYWrAETAOqtFf7jypgTW0+w5tLCQ6WzSIyDkH+Djjn
	 DIryNVShK0ZPG+gx7LGS56y9hYmNsGhoXlMUQ8YvoiHqWDlPA0o9RxUHyEpR6+zhhX
	 OkEhehWqCEJdVIZeNQ2gCrM5pbxOO7xEeawmUvc9XCjR/Rl1QFGlRDu9LASVQn4MBc
	 mVEtzkVfY408w==
Date: Fri, 9 May 2025 15:10:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Drop legacy jobs
In-Reply-To: <20250509215123.2953401-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505091508590.3879245@ubuntu-linux-20-04-desktop>
References: <20250509215123.2953401-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-913195864-1746828628=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-913195864-1746828628=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 9 May 2025, Andrew Cooper wrote:
> The CI improvements have been backported to all Xen branches.
> 
> Remove the transitionary tar/cpio parameter in scripts/alpine-rootfs.sh
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml               | 27 +---------------
>  scripts/alpine-rootfs.sh     | 23 ++++---------
>  scripts/x86_64-argo-linux.sh | 63 ------------------------------------
>  3 files changed, 8 insertions(+), 105 deletions(-)
>  delete mode 100755 scripts/x86_64-argo-linux.sh
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index dcf76db6ec62..2e1aad800b95 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -52,7 +52,7 @@ linux-6.6.86-arm64:
>  alpine-3.18-x86_64-rootfs:
>    extends: .x86_64-artifacts
>    script:
> -    - ./scripts/alpine-rootfs.sh cpio
> +    - ./scripts/alpine-rootfs.sh
>    variables:
>      CONTAINER: alpine:3.18-x86_64-base

There is one survivor just above:

alpine-3.18-arm64-rootfs:
  extends: .arm64-artifacts
  script:
    - ./scripts/alpine-rootfs.sh cpio
  variables:
    CONTAINER: alpine:3.18-arm64-base


Makes sense to fix it as well?

Everything else looks fine



> @@ -67,28 +67,3 @@ linux-6.6.56-x86_64:
>  microcode-x86:
>    extends: .x86_64-artifacts
>    script: ./scripts/x86-microcode.sh
> -
> -#
> -# The jobs below here are legacy and being phased out.
> -#
> -x86_64-kernel-linux-6.6.56:
> -  extends: .x86_64-artifacts
> -  script: ./scripts/build-linux.sh
> -  variables:
> -    LINUX_VERSION: 6.6.56
> -
> -x86_64-rootfs-alpine-3.18:
> -  extends: .x86_64-artifacts
> -  script:
> -    - ./scripts/alpine-rootfs.sh tar
> -  variables:
> -    CONTAINER: alpine:3.18-x86_64-base
> -
> -x86_64-argo-linux-6.6.56:
> -  extends: .x86_64-artifacts
> -  script:
> -    - . scripts/x86_64-argo-linux.sh
> -  variables:
> -    LINUX_VERSION: 6.6.56
> -    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
> -    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index 13d39e8846e7..c304e2ebfbd9 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -77,20 +77,11 @@ passwd -d "root" root
>  
>  # Create rootfs
>  cd /
> -case $1 in
> -    cpio)
> -        {
> -            PATHS="bin etc home init lib mnt opt root sbin srv usr var"
> -            find $PATHS -print0
> -            echo -ne "dev\0proc\0run\0sys\0"
> -        } | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
> +{
> +    PATHS="bin etc home init lib mnt opt root sbin srv usr var"
> +    find $PATHS -print0
> +    echo -ne "dev\0proc\0run\0sys\0"
> +} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
>  
> -        # Print the contents for the build log
> -        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> -        ;;
> -
> -    tar)
> -        PATHS="bin dev etc home init lib mnt opt root sbin usr var"
> -        tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
> -        ;;
> -esac
> +# Print the contents for the build log
> +zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> diff --git a/scripts/x86_64-argo-linux.sh b/scripts/x86_64-argo-linux.sh
> deleted file mode 100755
> index a110a3378192..000000000000
> --- a/scripts/x86_64-argo-linux.sh
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -#!/usr/bin/env bash
> -
> -if test -z "${LINUX_VERSION}"
> -then
> -    >&2 echo "LINUX_VERSION must be set"; exit 1
> -fi
> -
> -set -ex -o pipefail
> -
> -BUILDDIR="${PWD}"
> -COPYDIR="${BUILDDIR}/binaries/"
> -
> -# Prepare Linux sources
> -curl -fsSLO \
> -    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
> -tar xJf linux-"${LINUX_VERSION}".tar.xz
> -cd linux-"${LINUX_VERSION}"
> -make ARCH=x86 defconfig
> -make ARCH=x86 xen.config
> -./scripts/config --enable BRIDGE
> -./scripts/config --enable IGC
> -./scripts/config --enable TUN
> -cp .config .config.orig
> -cat .config.orig \
> -    | grep 'XEN' \
> -    | grep '=m' \
> -    | sed 's/=m/=y/g' \
> -    >> .config
> -make ARCH=x86 olddefconfig
> -make ARCH=x86 modules_prepare
> -
> -# Build Linux kernel module for Xen Argo
> -cd "${BUILDDIR}"
> -git clone \
> -    --depth=1 --branch=master \
> -    https://github.com/OpenXT/linux-xen-argo.git
> -git -C "${BUILDDIR}/linux-xen-argo" switch --detach "${ARGO_SHA}"
> -make -C "linux-${LINUX_VERSION}" M="${BUILDDIR}/linux-xen-argo/argo-linux" \
> -    CFLAGS_MODULE="-Wno-error" KBUILD_MODPOST_WARN=1
> -cp "linux-xen-argo/argo-linux/xen-argo.ko" "${COPYDIR}/xen-argo.ko"
> -
> -# Build Linux libargo shared library, applying fixes to build in Alpine Linux
> -cd "${BUILDDIR}/linux-xen-argo/libargo"
> -sed -i "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" configure.ac
> -sed -i "s/__SOCKADDR_COMMON (sxenargo_)/sa_family_t sxenargo_family/" src/libargo.h
> -sed -i "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" src/libargo.h
> -autoreconf --install
> -./configure --prefix="${COPYDIR}" CPPFLAGS="-I${PWD}/../argo-linux/include"
> -make
> -make install
> -
> -# Build Linux user program, modifying for xilinx argo test
> -cd "${BUILDDIR}"
> -wget "https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/\
> -recipes-openxt/argo-exec/argo-exec/argo-exec.c"
> -sed -i "s|#include <xen/xen.h>||" argo-exec.c
> -sed -i "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" \
> -    argo-exec.c
> -gcc -I"${BUILDDIR}/linux-xen-argo/libargo/src" \
> -    -I"${BUILDDIR}/linux-xen-argo/argo-linux/include" \
> -    -L"${COPYDIR}/lib/" \
> -    -o argo-exec argo-exec.c -largo
> -cp argo-exec "${COPYDIR}"
> 
> base-commit: 683a1f67a82e8ea151c818d74a50522ca2e67236
> -- 
> 2.39.5
> 
--8323329-913195864-1746828628=:3879245--

