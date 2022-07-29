Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B958574E
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 01:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377916.611235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHZL8-0006C3-0r; Fri, 29 Jul 2022 23:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377916.611235; Fri, 29 Jul 2022 23:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHZL7-00069y-UN; Fri, 29 Jul 2022 23:24:17 +0000
Received: by outflank-mailman (input) for mailman id 377916;
 Fri, 29 Jul 2022 23:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HszZ=YC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHZL6-00069c-4k
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 23:24:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f74e413-0f95-11ed-924f-1f966e50362f;
 Sat, 30 Jul 2022 01:24:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76D02B82A02;
 Fri, 29 Jul 2022 23:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1900C433D6;
 Fri, 29 Jul 2022 23:24:12 +0000 (UTC)
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
X-Inumbo-ID: 8f74e413-0f95-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659137053;
	bh=691hN3/qyo2rTRY0Mum+QKzj4Fw/7Q3um4iGth0kZLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mXaLIBUwpGL1WQFfFa6mOdkxUtV/y/iATDlGJDm6WMTtILVQd9eVY9TRzNDdQA+Dk
	 WVeTYkNr4J6V01v1C1bIW3CNJ4JhVgpbuo8R5QQ1QljL8C+j/X8h6qVAlOAHmArVYA
	 90+OAWn2uL54EslX+J9SjZemLLbdaD8XmxByiA7xo5PRGqsaHlh0UP+z2zymjYSNOu
	 DXdNiUUjxpAP1RfufN9wu2x8y1n18KQ5xIVzwl/G4ZvNVWCb+oxJVWHDexlq8x2woj
	 knYcCGZtHrAYg9yhR5r1Oq+Shi2UWWNfY1JtGAea6eBZoBXqNB1uahkJZ2RizGjMJ7
	 8TPMZhM73Srbw==
Date: Fri, 29 Jul 2022 16:24:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] automation: qemu-smoke-arm64.sh: Rename the device
 tree to avoid confusion
In-Reply-To: <20220729145229.1250221-3-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207291624050.4648@ubuntu-linux-20-04-desktop>
References: <20220729145229.1250221-1-burzalodowa@gmail.com> <20220729145229.1250221-3-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jul 2022, Xenia Ragiadakou wrote:
> Rename the device tree from virt-gicv3 to virt-gicv2 to avoid confusion
> since the version of the generic interrupt controller used for this test
> is the v2 and not the v3.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qemu-smoke-arm64.sh | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index f483a2ffc1..7ac82b2278 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -36,11 +36,11 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>     -machine virtualization=true \
>     -cpu cortex-a57 -machine type=virt \
>     -m 1024 -display none \
> -   -machine dumpdtb=binaries/virt-gicv3.dtb
> +   -machine dumpdtb=binaries/virt-gicv2.dtb
>  # XXX disable pl061 to avoid Linux crash
> -dtc -I dtb -O dts binaries/virt-gicv3.dtb > binaries/virt-gicv3.dts
> -sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts > binaries/virt-gicv3-edited.dts
> -dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
> +dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
> +sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv2.dts > binaries/virt-gicv2-edited.dts
> +dtc -I dts -O dtb binaries/virt-gicv2-edited.dts > binaries/virt-gicv2.dtb
>  
>  
>  # Busybox
> @@ -73,7 +73,7 @@ cd ..
>  echo 'MEMORY_START="0x40000000"
>  MEMORY_END="0x80000000"
>  
> -DEVICE_TREE="virt-gicv3.dtb"
> +DEVICE_TREE="virt-gicv2.dtb"
>  XEN="xen"
>  DOM0_KERNEL="Image"
>  DOM0_RAMDISK="initrd"
> -- 
> 2.34.1
> 

