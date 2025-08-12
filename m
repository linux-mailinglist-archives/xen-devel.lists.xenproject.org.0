Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786BB23C34
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 01:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079325.1440274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uly87-00044c-SH; Tue, 12 Aug 2025 23:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079325.1440274; Tue, 12 Aug 2025 23:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uly87-00042z-PO; Tue, 12 Aug 2025 23:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1079325;
 Tue, 12 Aug 2025 23:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IykP=2Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uly86-0003wl-RN
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 23:10:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b1d49c7-77d1-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 01:10:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0A305C649A;
 Tue, 12 Aug 2025 23:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC02C4CEF0;
 Tue, 12 Aug 2025 23:10:02 +0000 (UTC)
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
X-Inumbo-ID: 7b1d49c7-77d1-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755040203;
	bh=9gtm1OV3n75KUH5b2aknLcFzG6FJiNXndbX7+7KGhuk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LTT/D3stN4IzAIHFsNY/8p7xo0+4oWD6QiZSaFBGtMCuE+basmnoVg2dGZG6s4MNw
	 iDKWstVdtvUIC18TqYQbhjbGQwS7jRqTJzs8LW0fJY3RnZzCHpa0H26gcs01imSGF1
	 q1aS2W3YaNqJrFaDmcdBJje5Aq1b4uNiofUj/7lEJjeB2V1oqHCxaDjIjebkkWjXQI
	 5bt1ZXTXVEZZxHV1z031+/vXhhyHW5U+TgXJxoQ0yJta+s0/EerxcZlwQD80QaVVVJ
	 tuB2K9k9NsUSZI305n8mZwyXLw8iRmKj+3gqqa3Xl6AJc+qQ1/o0pH84igmsk0LKc/
	 6NDvftGvw9K/g==
Date: Tue, 12 Aug 2025 16:10:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, andrei.cherechesu@nxp.com, dmukhin@ford.com
Subject: Re: [ImageBuilder v2] Make DEVICE_TREE optional parameter
In-Reply-To: <20250812173350.2612682-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2508121609520.2883419@ubuntu-linux-20-04-desktop>
References: <20250812173350.2612682-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1638558391-1755040203=:2883419"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1638558391-1755040203=:2883419
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 12 Aug 2025, Ayan Kumar Halder wrote:
> There are systems where device tree binary is passed by the U-Boot as
> $fdtcontroladdr. In such cases, no external device tree binary is provided
> during uboot script generation.
> 
> This is an enhancement on top of the following commit:-
> uboot-script-gen: Dynamically compute addr and size when loading bina…
> 
> When DEVICE_TREE is not present, user should provide '-s' as the addresses and
> sizes should be computed dynamically from U-Boot.
> 
> Also, fixed uboot-script-gen to set host_kernel_addr when BOOT_CMD="none" and
> '-s' is not used.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch should be applied after the previous patch.
> "[ImageBuilder v2] Add config option to use separate load commands for..."
> 
> Changes from :-
> 
> v1 :- 1. Check that user provides '-s' when DEVICE_TREE is not set, instead of
> setting CALC silently.
> 
> 2. Set 'host_fdt_addr' to '\${fdtcontroladdr}' when DEVICE_TREE is not set.
> 
> 3. Add a fix for BOOT_CMD="none".
>  
>  README.md                |  5 ++++-
>  scripts/uboot-script-gen | 29 +++++++++++++++++++++++------
>  2 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 59919df..fc448e0 100644
> --- a/README.md
> +++ b/README.md
> @@ -92,7 +92,10 @@ Where:
>    DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
>    env variables respectively, to be used manually when booting.
>  
> -- DEVICE_TREE specifies the DTB file to load.
> +- DEVICE_TREE specifies the DTB file to load. If not set, then $fdtcontroladdr
> +  is used as the address of the DTB loaded by u-boot. If user does not set this
> +  option, then '-s' should be provided to ensure that addresses and sizes are
> +  calculated dynamically by uboot.
>  
>  - XEN specifies the Xen hypervisor binary to load. Note that it has to
>    be a regular Xen binary, not a u-boot binary.
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 656de72..be61fc4 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -591,7 +591,7 @@ function device_tree_editing()
>  
>  function fill_reserved_spaces_from_dtb()
>  {
> -    if [ ! -f $DEVICE_TREE ]
> +    if test ! -f $DEVICE_TREE || test -z "$DEVICE_TREE"
>      then
>          if test "$CALC"; then
>              return
> @@ -1674,6 +1674,16 @@ fi
>  
>  rm -f $UBOOT_SOURCE $UBOOT_SCRIPT
>  
> +if test -z "$DEVICE_TREE"
> +then
> +    if test -z "$CALC"
> +    then
> +       echo "DEVICE_TREE is unset and -s is not specified"
> +       exit 1
> +    fi
> +    echo "setenv host_fdt_addr \${fdtcontroladdr}" >> $UBOOT_SOURCE
> +fi
> +
>  if test "$FIT"
>  then
>      echo 'fit_addr=$fileaddr' >>  $UBOOT_SOURCE
> @@ -1721,9 +1731,13 @@ then
>      done
>  fi
>  
> -check_file_type $DEVICE_TREE "Device Tree Blob"
> -device_tree_addr=$memaddr
> -load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
> +if test "$DEVICE_TREE"
> +then
> +    check_file_type $DEVICE_TREE "Device Tree Blob"
> +    device_tree_addr=$memaddr
> +    load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
> +fi
> +
>  bitstream_load_and_config  # bitstream is loaded last but used first
>  device_tree_editing $device_tree_addr
>  
> @@ -1751,8 +1765,11 @@ then
>      fi
>  else
>      # skip boot command but store load addresses to be used later
> -    echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
> -    echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
> +    if test -z "$CALC"
> +    then
> +        echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
> +        echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
> +    fi
>  fi
>  
>  if test "$FIT"
> -- 
> 2.25.1
> 
--8323329-1638558391-1755040203=:2883419--

