Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE356569713
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 02:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362688.592842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Fp6-0007BI-T2; Thu, 07 Jul 2022 00:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362688.592842; Thu, 07 Jul 2022 00:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Fp6-00078Z-Pv; Thu, 07 Jul 2022 00:56:52 +0000
Received: by outflank-mailman (input) for mailman id 362688;
 Thu, 07 Jul 2022 00:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tNfF=XM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9Fp5-00078T-AW
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 00:56:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7c8774-fd8f-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 02:56:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 366AB61FFA;
 Thu,  7 Jul 2022 00:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D4BC3411C;
 Thu,  7 Jul 2022 00:56:46 +0000 (UTC)
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
X-Inumbo-ID: ad7c8774-fd8f-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657155406;
	bh=sYzXcLj/Fo9Tar0VzolAUoZ9qPBWrQXPMFOq6nT4xI4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pxUDBYRAS5p6yacA2CoY4/JL6NOs3ZX8IYZUEfPPBHmImg1zjEPvJlPKVhnfEHYow
	 ExCi4D/+n8ifIZOCdi2azLRycLpXHMsnuK8BsgkJ727VZSn1oAbDtKul8A2SjYcNJY
	 fIgL7DaYJhsVhY361xgy9tupYZPGsk/mN6Gb4URACpCJKTx11AdU6HrpUY1+M0FNkI
	 B6uqZm9Pk6rNP0f6qTBbJLv93cZZf96J7fdQGvZL94/fNxUAQyUqG73EwlyW9zkgTC
	 llQvWwc4qq63Lp7Qy3YH7RzqQ5Q7IM+RGDnzeiPKbP9TSxRLUAkmZ6zwL/XtGRq8dO
	 Pem6hFu4H15fQ==
Date: Wed, 6 Jul 2022 17:56:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net, 
    sstabellini@kernel.org, Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [ImageBuilder][PATCH v2 4/4] uboot-script-gen: Enable not adding
 boot command to script
In-Reply-To: <20220630140028.3227385-5-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2207061720410.2354836@ubuntu-linux-20-04-desktop>
References: <20220630140028.3227385-1-andrei.cherechesu@oss.nxp.com> <20220630140028.3227385-5-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jun 2022, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> If the "BOOT_CMD" variable is set to "none" inside the config
> file, the boot command (i.e. "booti") will not by added to the
> generated script, to allow the user to customize the u-boot env
> or the device-tree after executing the script commands and before
> actually booting.
> 
> Added commands to store the addresses where the Xen image and
> device-tree file are loaded, in 'host_kernel_addr' and 'host_fdt_addr'
> variables, if the boot command is skipped and the "-s" parameter is
> not used.
> 
> The `booti` command can then be executed as part of the 'bootcmd' variable
> in u-boot, which should contain:
> 	1. fetching the generated u-boot script
> 	2. executing the script
> 	3. running `booti ${host_kernel_addr} - ${host_fdt_addr}` command
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I think this patch is fine in principle but I need to review in a bit
more details patch #2 before I am able to commit it


> ---
>  README.md                |  5 ++++-
>  scripts/uboot-script-gen | 16 +++++++++++++---
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/README.md b/README.md
> index cb15ca5..b1a9b9d 100644
> --- a/README.md
> +++ b/README.md
> @@ -80,7 +80,10 @@ Where:
>  
>  - BOOT_CMD specifies the u-boot command used to boot the binaries.
>    By default, it is 'booti'. The acceptable values are 'booti', 'bootm'
> -  and 'bootefi'.
> +  and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
> +  added to the boot script, and the addresses for the Xen binary and the
> +  DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
> +  env variables respectively, to be used manually when booting.
>  
>  - DEVICE_TREE specifies the DTB file to load.
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 444c65a..994369c 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -966,7 +966,7 @@ function check_depends()
>  
>  function check_boot_cmd()
>  {
> -    if ! [[ " bootm booti bootefi " =~ " ${BOOT_CMD}" ]]
> +    if ! [[ " bootm booti bootefi none " =~ " ${BOOT_CMD}" ]]
>      then
>          echo "\"BOOT_CMD=$BOOT_CMD\" is not valid"
>          exit 1
> @@ -1255,9 +1255,19 @@ echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
>  
>  if test "$dynamic_loading_opt"
>  then
> -    echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
> +    if [ "$BOOT_CMD" != "none" ]
> +    then
> +        echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
> +    fi
>  else
> -    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
> +    if [ "$BOOT_CMD" != "none" ]
> +    then
> +        echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
> +    else
> +        # skip boot command but store load addresses to be used later
> +        echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
> +        echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
> +    fi
>  fi
>  
>  if test "$FIT"
> -- 
> 2.35.1
> 

