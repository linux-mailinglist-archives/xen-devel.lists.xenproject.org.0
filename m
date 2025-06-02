Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19AACBD7E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 00:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003877.1383496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uME27-0005it-EI; Mon, 02 Jun 2025 22:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003877.1383496; Mon, 02 Jun 2025 22:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uME27-0005gO-Ba; Mon, 02 Jun 2025 22:53:31 +0000
Received: by outflank-mailman (input) for mailman id 1003877;
 Mon, 02 Jun 2025 22:53:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm0f=YR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uME25-0005gI-GG
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 22:53:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65359303-4004-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 00:53:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 594CA442B1;
 Mon,  2 Jun 2025 22:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA88C4CEEB;
 Mon,  2 Jun 2025 22:53:25 +0000 (UTC)
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
X-Inumbo-ID: 65359303-4004-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748904806;
	bh=iFvTd3IYXCEQsHqPg5lcyVvNBcFSx2lQ/o1KUjtbwqY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IXG3i98AbPxmtH0IiFOMT3KCizLiwMDHZISzcD22J0bYMp2PKc4Br58A9zF5X9FHC
	 tfCcG8CLMlOmC0jiLFeaJbKFkK0gCeiE25BfZ8Lw+NXKiiTseb8pbkswCx3EhpAAhD
	 nqj7UWdJHvEpJ/9drelnbEeTtbstD1K6sQkdH1bwgbHcdjTqWmiEToRICg0eQlO+Cj
	 9QpG24bSvC0BRfGOFK8lpDIPbvgQQlNpd00Qt3J2S8PM4yPEW4NTGM4ic39PN748BY
	 54ML3ZHqG6aKMgZ6h0/mq+Piva6MJpAZnKygvgV/ADX5zafu4CSjIV7IbOfm/E2pI3
	 W1+IZIpB0dd5w==
Date: Mon, 2 Jun 2025 15:53:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] CI: Adjust how domU is packaged in dom0
In-Reply-To: <20250602174618.2641439-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506021553170.1147082@ubuntu-linux-20-04-desktop>
References: <20250602174618.2641439-1-andrew.cooper3@citrix.com> <20250602174618.2641439-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-827388975-1748904806=:1147082"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-827388975-1748904806=:1147082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Jun 2025, Andrew Cooper wrote:
> Package domU for dom0 and insert into the uncompressed part of dom0's rootfs,
> rather than recompressing it as part of the overlay.
> 
> For Qubes, this avoids putting the domU kernel in dom0's rootfs for tests
> which aren't going to boot a guest.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> v2:
>  * Rebase over dom0_rootfs_extra_{un,}comp changes
>  * Move back into boot.  There seem to be objections to having it in root.
> ---
>  automation/scripts/qubes-x86-64.sh             | 17 ++++++++++++-----
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh | 14 +++++++++++---
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 5ec6eff6c469..d9ecc569c956 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -156,7 +156,7 @@ esac
>  domU_config="
>  type = '${domU_type}'
>  name = 'domU'
> -kernel = '/boot/vmlinuz'
> +kernel = '/boot/vmlinuz-domU'
>  ramdisk = '/boot/initrd-domU'
>  cmdline = 'root=/dev/ram0 console=hvc0'
>  memory = 512
> @@ -187,6 +187,17 @@ Kernel \r on an \m (\l)
>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>      cd ..
>      rm -rf rootfs
> +
> +    # Package domU kernel+rootfs in /boot for dom0 (uncompressed)
> +    mkdir -p rootfs/boot
> +    cd rootfs
> +    cp ../binaries/bzImage boot/vmlinuz-domU
> +    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +    cd ..
> +    rm -rf rootfs
> +
> +    dom0_rootfs_extra_uncomp+=(binaries/domU-in-dom0.cpio)
>  fi
>  
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to come
> @@ -241,10 +252,6 @@ mkdir -p etc/default
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> -cp ../binaries/bzImage boot/vmlinuz
> -if [ -n "$domU_check" ]; then
> -    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> -fi
>  find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
>  
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 45121f39400a..8981aee5d4f2 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -22,7 +22,7 @@ DOMU_CMD=""
>  DOMU_CFG='
>  type = "pvh"
>  name = "domU"
> -kernel = "/boot/vmlinuz"
> +kernel = "/boot/vmlinuz-domU"
>  ramdisk = "/boot/initrd-domU"
>  extra = "root=/dev/ram0 console=hvc0"
>  memory = 512
> @@ -106,10 +106,20 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
>  
> +# Package domU kernel+rootfs in /boot for dom0 (uncompressed)
> +mkdir -p rootfs/boot
> +cd rootfs
> +cp ../binaries/bzImage boot/vmlinuz-domU
> +cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +cd ..
> +rm -rf rootfs
> +
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to come
>  # first, and all uncompressed must be ahead of compressed.
>  dom0_rootfs_parts=(
>      binaries/ucode.cpio
> +    binaries/domU-in-dom0.cpio
>      "${dom0_rootfs_extra_uncomp[@]}"
>      binaries/rootfs.cpio.gz
>      binaries/xen-tools.cpio.gz
> @@ -131,8 +141,6 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> -cp ../binaries/bzImage boot/vmlinuz
> -cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
>  find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
>  
> -- 
> 2.39.5
> 
--8323329-827388975-1748904806=:1147082--

