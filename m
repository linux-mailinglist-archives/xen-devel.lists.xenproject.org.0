Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A85833F9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 22:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376459.609238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGnPc-0006IH-St; Wed, 27 Jul 2022 20:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376459.609238; Wed, 27 Jul 2022 20:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGnPc-0006FR-PB; Wed, 27 Jul 2022 20:13:44 +0000
Received: by outflank-mailman (input) for mailman id 376459;
 Wed, 27 Jul 2022 20:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGnPa-0006F5-Rf
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 20:13:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b900ff0-0de8-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 22:13:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A58AB8225E;
 Wed, 27 Jul 2022 20:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7226CC433D6;
 Wed, 27 Jul 2022 20:13:38 +0000 (UTC)
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
X-Inumbo-ID: 9b900ff0-0de8-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658952819;
	bh=YH5zMYlyZYs8//oUEqbK8GQc0YiP9Sp80pteJSo3czs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Odz671DV0RJ4bvpaecTa4BrCBFtCfVmtNrV5NY4jg1c3/l8cCRvWhmZySInyzpl/Y
	 cWj05Lbr27Kzfy4kfEw7TIDgYmYYtetTkaBYLZSv2YivLmsYWJcC9MTE93Dlhqf9bL
	 Q2IeI9HggslH4FqvAU34M45nEi+mge+twezF3cqxaw4Zld9s4zcQc/ytCONsOHTrJE
	 V0QLx1Rxax4ywvzhNZfqLQJHkjFM1rRkMxMIa4aoGHNIso+hM+eDIIa9JgVKoEoI9X
	 OGrP3AgZwUTue2kwN3xusYfY76SiSbwAQeg0qDgDNkrxc7D1jQVtI/wlGF0hgiOmUf
	 xbLaVC7VjAIFQ==
Date: Wed, 27 Jul 2022 13:13:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net, 
    sstabellini@kernel.org, Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [ImageBuilder][PATCH v3 3/3] uboot-script-gen: Enable not adding
 boot command to script
In-Reply-To: <20220713163044.3541661-4-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2207271312290.4648@ubuntu-linux-20-04-desktop>
References: <20220713163044.3541661-1-andrei.cherechesu@oss.nxp.com> <20220713163044.3541661-4-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Jul 2022, Andrei Cherechesu (OSS) wrote:
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
> variables, if BOOTCMD = "none".
> 
> The `booti` command can then be executed as part of the 'bootcmd' variable
> in u-boot, which should contain:
> 	1. fetching the generated u-boot script
> 	2. executing the script
> 	3. running `booti ${host_kernel_addr} - ${host_fdt_addr}` command
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Given that this patch is non-controversial, I committed it before patch
#1. The small part affecting the "$dynamic_loading_opt" case will need
rebasing.


> ---
>  README.md                |  5 ++++-
>  scripts/uboot-script-gen | 16 +++++++++++++---
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 3566a6d..07ad432 100644
> --- a/README.md
> +++ b/README.md
> @@ -81,7 +81,10 @@ Where:
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
> index f72551a..6a8a2b8 100755
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
> @@ -1251,9 +1251,19 @@ fi
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

