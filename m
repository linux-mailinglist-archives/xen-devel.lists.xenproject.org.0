Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9130D9AF5E2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 01:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825600.1239872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t47YH-0003Qy-5J; Thu, 24 Oct 2024 23:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825600.1239872; Thu, 24 Oct 2024 23:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t47YH-0003P6-2M; Thu, 24 Oct 2024 23:47:37 +0000
Received: by outflank-mailman (input) for mailman id 825600;
 Thu, 24 Oct 2024 23:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V9Wq=RU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t47YF-0003P0-5G
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 23:47:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55c4beb8-9262-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 01:47:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9F48A5C4B47;
 Thu, 24 Oct 2024 23:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5C7C4CEC7;
 Thu, 24 Oct 2024 23:47:29 +0000 (UTC)
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
X-Inumbo-ID: 55c4beb8-9262-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729813650;
	bh=ki5lJlSSikUVgMuaB9x7iJUB/P/ayoizS1rLBj7VnUo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=awGxn6HS/CTG+R/CqqQ5neRiaUCKoXG8mjQu/gzoUQdd9dJpqeqy9SoUNyBPPOja+
	 YA5MA7OwKqdG4kPuCRNN5qT1962kNGOzaUdY1ye0NG5ePf9/6F6uuNf2Sd0gc6UQEZ
	 QrwSVR2ZgrS8aJJ9ebld8VedfL+w76+vetL5Hk9j/bqZb/29gspIGQFWX9dZsN/jSX
	 zIGS9ChBmIXXeckqcoH4R735zp5+KklxPksiL0aMwgK7suE0Qvz52SaRgEuLsvht1Z
	 1iHx4/9uqG5R0UM/Z1d/0B5cQzBFBXSE051kWK3kepvZ2Lq8F6jdC2Y1wEEHSabg+t
	 2o+bAvlTsxg2Q==
Date: Thu, 24 Oct 2024 16:47:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Javi Merino <javi.merino@cloud.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 6/6] CI: Run the builds and tests that use the
 Debian 12 containers as a normal user
In-Reply-To: <c6d8547d500ac419ee4590decb9392f32f1f0d02.1729760501.git.javi.merino@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2410241631250.3833@ubuntu-linux-20-04-desktop>
References: <cover.1729760501.git.javi.merino@cloud.com> <c6d8547d500ac419ee4590decb9392f32f1f0d02.1729760501.git.javi.merino@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Oct 2024, Javi Merino wrote:
> Use FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR so that GitLab CI clones xen
> using the user in the image, instead of as root[0].
> 
> In qemu-smoke-dom0*.sh and qemu-alpine-x86_64.sh, use fakeroot to
> create the rootfs images that untar a tarball that create character
> devices.  cpio replicates the block and character devices, as well as
> preserving the uid and gid it sees in the current directory.  fakeroot
> lets tar think that it is creating block and character devices, and
> all files are owned by root, but it is all smokes and mirrors for
> cpio.
> 
> [0] https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1736
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
> 
> Regarding building the rootfs, I have chosen to use a fakeroot
> subshell for the entire process.  automation/scripts/qubes-x86-64.sh
> takes a different approach, it just uses fakeroot for the tar/cpio
> commands.  I prefer to do it this way but I am happy to be overridden
> if `fakeroot -s ../save tar` and `fakeroot -i ../save cpio` are
> preferred.
> 
>  automation/build/debian/12-arm64v8.dockerfile   | 5 ++++-
>  automation/build/debian/12-x86_64.dockerfile    | 5 ++++-
>  automation/gitlab-ci/test.yaml                  | 4 ++++
>  automation/scripts/qemu-alpine-x86_64.sh        | 4 +++-
>  automation/scripts/qemu-smoke-dom0-arm64.sh     | 7 +++++--
>  automation/scripts/qemu-smoke-dom0less-arm64.sh | 5 +++--
>  6 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
> index 4da1b074aedb..c2617956ed77 100644
> --- a/automation/build/debian/12-arm64v8.dockerfile
> +++ b/automation/build/debian/12-arm64v8.dockerfile
> @@ -10,6 +10,8 @@ RUN <<EOF
>  #!/bin/bash
>      set -eu
>  
> +    useradd --create-home user
> +
>      apt-get update
>      DEPS=(
>          # Xen
> @@ -53,6 +55,7 @@ RUN <<EOF
>          curl
>          device-tree-compiler
>          expect
> +        fakeroot
>          u-boot-qemu
>          # for imagebuilder
>          file
> @@ -64,5 +67,5 @@ RUN <<EOF
>      rm -rf /var/lib/apt/lists*
>  EOF
>  
> -USER root
> +USER user
>  WORKDIR /build
> diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
> index e0ca8b7e9c91..98b23ea3eaa4 100644
> --- a/automation/build/debian/12-x86_64.dockerfile
> +++ b/automation/build/debian/12-x86_64.dockerfile
> @@ -10,6 +10,8 @@ RUN <<EOF
>  #!/bin/bash
>      set -eu
>  
> +    useradd --create-home user
> +
>      apt-get update
>      DEPS=(
>          # Xen
> @@ -54,6 +56,7 @@ RUN <<EOF
>          # for qemu-alpine-x86_64-gcc
>          busybox-static
>          cpio
> +        fakeroot
>  
>          # For *-efi jobs
>          ovmf
> @@ -64,5 +67,5 @@ RUN <<EOF
>      rm -rf /var/lib/apt/lists*
>  EOF
>  
> -USER root
> +USER user
>  WORKDIR /build

This breaks the xilinx hardware jobs both arm and x86 as they
require root inside the container at the moment


> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 42baa82fe36f..71f2beb68c4f 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -1,6 +1,10 @@
>  .test-jobs-common:
>    stage: test
>    image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  variables:
> +    # Clone xen as the user in the docker images, not root
> +    # See https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1736
> +    FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR: true
>  
>  .arm64-test-needs: &arm64-test-needs
>    - alpine-3.18-arm64-rootfs-export
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 1ff689b577e3..2660403ab2b8 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -29,6 +29,7 @@ find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
>  cd ..
>  
>  # initrd.tar.gz is Dom0 rootfs
> +fakeroot <<EOF
>  mkdir -p rootfs
>  cd rootfs
>  tar xvzf ../initrd.tar.gz
> @@ -63,7 +64,8 @@ chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
>  # rebuild Dom0 rootfs
>  find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
> -cd ../..
> +EOF
> +cd ..

I admit I am not a fan of this as it makes the script harder to read.
Given that almost everything on this script and similar scripts is
better run as root because it is all about repackaging cpio archivies,
instead I would do this:

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 2660403ab2..7c0ec01e05 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/usr/bin/fakeroot
 
 set -ex -o pipefail
 

Keeping in mind that anyone could push a branch without fakeroot to
their personal tree triggering a gitlab-ci pipeline, the advantage of
using fakeroot would be if we force the container execution envinronment
(gitlab runner) to run containers as user. This is not currently the
configuration we have. As of now, it doesn't bring an advantage.

Given that the gitlab runners are in flux at the moment, and that this
patch cannot work with the xilinx runners, I would ask you to please
hold on on this patch until the gitlab runners are settled (~1 month).



>  cat >> binaries/pxelinux.0 << EOF
>  #!ipxe
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index 4d22a124df11..8f9bfd620ee3 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -27,8 +27,10 @@ cd initrd
>  find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
>  cd ..
>  
> -mkdir -p rootfs
> +fakeroot <<EOF
> +mkdir rootfs
>  cd rootfs
> +
>  tar xvzf ../initrd.tar.gz
>  mkdir proc
>  mkdir run
> @@ -58,7 +60,8 @@ xl create -c /root/test.cfg
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
>  find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
> -cd ../..
> +EOF
> +cd ..
>  
>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>  curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 83e1866ca6c5..2d60f22d68b7 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -112,7 +112,8 @@ find . | cpio --create --format='newc' | gzip > ../binaries/initrd
>  cd ..
>  
>  # DOM0 rootfs
> -mkdir -p rootfs
> +fakeroot <<EOF
> +mkdir rootfs
>  cd rootfs
>  tar xzf ../binaries/initrd.tar.gz
>  mkdir proc
> @@ -141,7 +142,7 @@ ${dom0_check}
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
>  find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> -cd ..
> +EOF
>  
>  # ImageBuilder
>  echo 'MEMORY_START="0x40000000"
> -- 
> 2.45.2
> 

