Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E4585750
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 01:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377921.611247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHZLz-0006k3-CC; Fri, 29 Jul 2022 23:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377921.611247; Fri, 29 Jul 2022 23:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHZLz-0006hQ-8Z; Fri, 29 Jul 2022 23:25:11 +0000
Received: by outflank-mailman (input) for mailman id 377921;
 Fri, 29 Jul 2022 23:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HszZ=YC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHZLx-0006hA-NV
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 23:25:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aebb4240-0f95-11ed-bd2d-47488cf2e6aa;
 Sat, 30 Jul 2022 01:25:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9B5D6141C;
 Fri, 29 Jul 2022 23:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE60C433C1;
 Fri, 29 Jul 2022 23:25:05 +0000 (UTC)
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
X-Inumbo-ID: aebb4240-0f95-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659137106;
	bh=cT5zqBNc4VM3cWXiuqFmKVxZ/n4R7LwEFBBf1Emoa3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bud8hCc9X7EI1SFxQNWpQgMlX/saxu8V9C+ZCnE086mqAEO1pBToLWwCptthv7VGL
	 DhydcZ61lDnypp2CgXJh+VJFyOXJlxTn6oEbdGNK2r0CQjsk6U/eTslDR/C6vzLwyG
	 pc8R677JyLnhA8g4+3aQBwZIZMWoxAgf5xFy0Ugn8j3GZBt2+xPy0yLqZGfTmOdOmg
	 x3OA3kjXfGJlpsuPnprpO0sWWrJAst76HUiC7TCY3o7tDR491EBa9xBqN1vMgror/l
	 USc1ksxxZWsZtBpSqrntRqfiPzSoDJC+vrFe9l8p7lDyli7Xy3v/79PnG1syhtP1j6
	 tJSRJV/kZY7ig==
Date: Fri, 29 Jul 2022 16:25:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] automation: qemu-smoke-arm64.sh: Fix the number of
 cpus in the device tree
In-Reply-To: <20220729145229.1250221-4-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207291624350.4648@ubuntu-linux-20-04-desktop>
References: <20220729145229.1250221-1-burzalodowa@gmail.com> <20220729145229.1250221-4-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Jul 2022, Xenia Ragiadakou wrote:
> Qemu VM is configured with 2 cpus but the device tree passed has only 1.
> Generate a device tree with 2 cpus.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> I am not sure for this patch because I do not know whether the number of cpus
> differs deliberately.

Yes let's go with 2

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

>  automation/scripts/qemu-smoke-arm64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 7ac82b2278..b48a20988f 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -35,7 +35,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
>  ./binaries/qemu-system-aarch64 \
>     -machine virtualization=true \
>     -cpu cortex-a57 -machine type=virt \
> -   -m 1024 -display none \
> +   -m 1024 -smp 2 -display none \
>     -machine dumpdtb=binaries/virt-gicv2.dtb
>  # XXX disable pl061 to avoid Linux crash
>  dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
> -- 
> 2.34.1
> 

