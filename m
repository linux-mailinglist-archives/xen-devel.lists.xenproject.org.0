Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035F6304E4
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 00:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445942.701391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owB6S-0005m1-NQ; Fri, 18 Nov 2022 23:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445942.701391; Fri, 18 Nov 2022 23:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owB6S-0005iq-K4; Fri, 18 Nov 2022 23:49:00 +0000
Received: by outflank-mailman (input) for mailman id 445942;
 Fri, 18 Nov 2022 23:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJKL=3S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1owB6R-0005QC-E1
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 23:48:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91736158-679b-11ed-91b6-6bf2151ebd3b;
 Sat, 19 Nov 2022 00:48:58 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56B56627E3;
 Fri, 18 Nov 2022 23:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFAEC433C1;
 Fri, 18 Nov 2022 23:48:55 +0000 (UTC)
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
X-Inumbo-ID: 91736158-679b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668815336;
	bh=sJelOwOAWzvSA2FGL8q+He9FN0rOxw50Vkr2Xrn/ZyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tFkDQMbyk59dmvARLwHyzZtB0nR6QC/Vlxgj9twnIpc1HopTOVw+8zrtmIcU1rLKj
	 okoU9b81qlR0nStkvdc/7gVhr0+TptR1hMFd+0bWtdHUOuvLSjmZc3QCRb7SRe11x0
	 gh+sYM5RKQpNJmN4Z7YkiOwUqj3aa4ErbUtn26G1AFfzu2qKC0nM2it3OO8geEVC8Z
	 KyoOf+NCbAZhSHps/HwbtRAYX6xrS4oxuXKOGCXFISRAkEc7dznuVDl0cum9o0Edyj
	 3Mjbsh/0rI0OeGx24mZmBnWMtw+fCi8DRbuUC/gF8+GzeDKs4UYgfD3Fb8GYKKe0IS
	 9Q6LkKOSGR8Zw==
Date: Fri, 18 Nov 2022 15:48:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: Remove installation of packages from
 test scripts
In-Reply-To: <20221117161643.3351-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2211181548480.1049131@ubuntu-linux-20-04-desktop>
References: <20221117161643.3351-1-michal.orzel@amd.com> <20221117161643.3351-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Nov 2022, Michal Orzel wrote:
> Now, when these packages are already installed in the respective
> containers, we can remove them from the test scripts.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qemu-alpine-x86_64.sh        | 4 ----
>  automation/scripts/qemu-smoke-dom0-arm32.sh     | 8 --------
>  automation/scripts/qemu-smoke-dom0-arm64.sh     | 9 ---------
>  automation/scripts/qemu-smoke-dom0less-arm64.sh | 9 ---------
>  4 files changed, 30 deletions(-)
> 
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 2e9625109c56..8c8d0b0cd759 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -2,10 +2,6 @@
>  
>  set -ex
>  
> -apt-get -qy update
> -apt-get -qy install --no-install-recommends cpio \
> -                                            busybox-static
> -
>  # DomU Busybox
>  cd binaries
>  mkdir -p initrd
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index ef19b988c2c4..98e4d481f65c 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -2,14 +2,6 @@
>  
>  set -ex
>  
> -export DEBIAN_FRONTEND=noninteractive
> -apt-get -qy update
> -apt-get -qy install --no-install-recommends u-boot-qemu \
> -                                            u-boot-tools \
> -                                            device-tree-compiler \
> -                                            curl \
> -                                            cpio
> -
>  cd binaries
>  # Use the kernel from Debian
>  curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index 9004c537e325..0bf5cfdc61f9 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -2,15 +2,6 @@
>  
>  set -ex
>  
> -export DEBIAN_FRONTEND=noninteractive
> -apt-get -qy update
> -apt-get -qy install --no-install-recommends u-boot-qemu \
> -                                            u-boot-tools \
> -                                            device-tree-compiler \
> -                                            cpio \
> -                                            curl \
> -                                            busybox-static
> -
>  # DomU Busybox
>  cd binaries
>  mkdir -p initrd
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index 933209e2e01e..2b59346fdcfd 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -38,15 +38,6 @@ fi
>  "
>  fi
>  
> -export DEBIAN_FRONTEND=noninteractive
> -apt-get -qy update
> -apt-get -qy install --no-install-recommends u-boot-qemu \
> -                                            u-boot-tools \
> -                                            device-tree-compiler \
> -                                            busybox-static \
> -                                            cpio \
> -                                            curl
> -
>  # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
>  curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
> -- 
> 2.25.1
> 

