Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8E5EB4C9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 00:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412108.655296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocwvi-0005uW-Lu; Mon, 26 Sep 2022 22:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412108.655296; Mon, 26 Sep 2022 22:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocwvi-0005ra-Id; Mon, 26 Sep 2022 22:50:26 +0000
Received: by outflank-mailman (input) for mailman id 412108;
 Mon, 26 Sep 2022 22:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HAa=Z5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ocwvh-0005r0-2g
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 22:50:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a20dbcd-3ded-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 00:50:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97F8860FB8;
 Mon, 26 Sep 2022 22:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C58CC433D6;
 Mon, 26 Sep 2022 22:50:20 +0000 (UTC)
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
X-Inumbo-ID: 9a20dbcd-3ded-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664232621;
	bh=f8EOT+6lj8f9RgA8vK5kdML1Sa0vspbm95sB52x8MPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lESM0fizcEbS0GBCHPRzOF/nIrOhLn45nQk0bWCAiNLyxL6KnDwdJaTvtkuX3qt/O
	 bG2M8AMm/V0r6iVikJ+8OEbsrSa8/Q2VaCymYFg0HHwFVQZ4tZsle6RaD7y8VLHQqE
	 pd2qHECb35NgjtN4mQWt7Vd794ewTRkJJKmIqMI/lGJABpq0L7IA7CvS2O0nphOhM4
	 6UXfpFFGFqxvSQjsrdMVYKniUZL6yvjv4YgCRrGjkcXghbhhUCrR6PPkfRxT8su0DZ
	 /UXUOL0QATr2wk4BbhzLcAl9khGaxQKnAf+mjSdXLl1wCnf2D8Ug83/PLEi+NBIOHt
	 F5D8LJc7NpAJg==
Date: Mon, 26 Sep 2022 15:50:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/10] automation: qemu-smoke-arm64.sh: Increase RAM
 size
In-Reply-To: <20220926110423.26030-4-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209261541080.922084@ubuntu-linux-20-04-desktop>
References: <20220926110423.26030-1-michal.orzel@amd.com> <20220926110423.26030-4-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Sep 2022, Michal Orzel wrote:
> In the follow-up patch we will add new jobs using debug Xen builds.
> Because the debug builds take more space and we might end up in
> a situation when there is not enough free space (especially during
> a static memory test that reserves some region in the middle), increase
> RAM size for QEMU from 1GB to 2GB.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - new patch carved out from previous v1 [3/9] patch
> ---
>  automation/scripts/qemu-smoke-arm64.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index f803835779f4..dea26c6c0a8f 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -52,7 +52,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
>     -machine virtualization=true \
>     -cpu cortex-a57 -machine type=virt \
> -   -m 1024 -smp 2 -display none \
> +   -m 2048 -smp 2 -display none \
>     -machine dumpdtb=binaries/virt-gicv2.dtb
>  
>  # XXX disable pl061 to avoid Linux crash
> @@ -117,7 +117,7 @@ cd ..
>  
>  # ImageBuilder
>  echo 'MEMORY_START="0x40000000"
> -MEMORY_END="0x80000000"
> +MEMORY_END="0xC0000000"
>  
>  DEVICE_TREE="virt-gicv2.dtb"
>  XEN="xen"
> @@ -158,7 +158,7 @@ timeout -k 1 240 \
>  ./binaries/qemu-system-aarch64 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
> -    -m 1024 -monitor none -serial stdio \
> +    -m 2048 -monitor none -serial stdio \
>      -smp 2 \
>      -no-reboot \
>      -device virtio-net-pci,netdev=n0 \
> -- 
> 2.25.1
> 

