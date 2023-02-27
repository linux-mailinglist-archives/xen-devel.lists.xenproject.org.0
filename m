Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB136A4DBC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 23:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502942.774995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWlch-0003ly-Ct; Mon, 27 Feb 2023 22:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502942.774995; Mon, 27 Feb 2023 22:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWlch-0003jl-9o; Mon, 27 Feb 2023 22:05:31 +0000
Received: by outflank-mailman (input) for mailman id 502942;
 Mon, 27 Feb 2023 22:05:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pWlcg-0003jf-2I
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 22:05:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6bf0180-b6ea-11ed-a550-8520e6686977;
 Mon, 27 Feb 2023 23:05:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1B6FB80D58;
 Mon, 27 Feb 2023 22:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF47C433EF;
 Mon, 27 Feb 2023 22:05:23 +0000 (UTC)
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
X-Inumbo-ID: d6bf0180-b6ea-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677535524;
	bh=+rOG6DHHJyZvzF2YGmfRc1bru4uKI8IUS93JX+4DHX0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t+7b4g4wtQkYmw2yoO5piyDt1UxgztLQCPpwfU4hpmYrcHs/2k1qWRxAyC7+x2WUo
	 EwvaLUUtJhdJ85dCHA2DYjqkcNsnnoCsbbSgzKKKulgtEOxM9L9jFN+DfdfOkcwyHy
	 JcHUDkhKhLZ9gNDJ7bT64ksTy44sEgNhFCAg3S/j7pVFr13c/PuhPYnnUVVriPFAMg
	 jaGkdyMi2ajFd+nbXjxInkursVYot4+CsXFCG/FPXVKMhuF6qHy64+YqMxe4hzKM3d
	 HC6lxdQcGc2MgATqK52ZYkya/WEHJshy9SlSsus1XOyTdWTQmF6vC2p9AXu5D9blCv
	 jmQSzTFtPdfFg==
Date: Mon, 27 Feb 2023 14:05:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Pavel Zhukov <pavel@zhukoff.net>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder][PATCH] uboot-script-gen: Add virtio loader
In-Reply-To: <20230221113035.5899-1-pavel@zhukoff.net>
Message-ID: <alpine.DEB.2.22.394.2302271405140.3680@ubuntu-linux-20-04-desktop>
References: <20230221113035.5899-1-pavel@zhukoff.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Feb 2023, Pavel Zhukov wrote:
> uboot supports virtio-blk drives and can load kernel image from it.
> Adding option to use '-t virtio' for loading image from virtio device
> 
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  README.md                | 14 +++++++-------
>  scripts/uboot-script-gen |  3 +++
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/README.md b/README.md
> index cb0cb13..64e62cd 100644
> --- a/README.md
> +++ b/README.md
> @@ -267,9 +267,9 @@ Where:\
>  -d specifies the "root" directory (paths in the config file are relative
>     to it), this is not a working directory (any output file locations
>     are specified in the config and any temporary files are in /tmp)\
> --t specifies the u-boot command to load the binaries. "tftp", "sd", "usb"
> -   and "scsi" are shorthands for "tftpb", "load mmc 0:1", "fatload usb 0:1"
> -   and "load scsi 0:1", but actually any arbitrary command can be used,
> +-t specifies the u-boot command to load the binaries. "tftp", "sd", "usb", "virtio"
> +   and "scsi" are shorthands for "tftpb", "load mmc 0:1", "fatload usb 0:1",
> +   "virtio load 0:1" and "load scsi 0:1", but actually any arbitrary command can be used,
>     for instance -t "fatload" is valid.  The only special commands are:
>     fit, which generates a FIT image using a script, and fit_std, which
>     produces a standard style of fit image without a script, but has
> @@ -339,10 +339,10 @@ Where:\
>  -o specifies the output disk image file name\
>  -a specifies whether the disk image size is to be aligned to the nearest
>     power of two\
> --t specifies the u-boot command to load the binaries. "tftp", "sd", "usb"
> -   and "scsi" are shorthands for "tftpb", "load mmc 0:1", "fatload usb 0:1"
> -   and "load scsi 0:1", but actually any arbitrary command can be used,
> -   for instance -t "fatload" is valid.
> +-t specifies the u-boot command to load the binaries. "tftp", "sd", "usb",
> +   "virtio" and "scsi" are shorthands for "tftpb", "load mmc 0:1",
> +   "fatload usb 0:1", "load virtio 0:1" and "load scsi 0:1", but actually
> +   any arbitrary command can be used, for instance -t "fatload" is valid.
>  
>  
>  disk\_image supports these additional parameters on the config file:
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 7e5cc08..f07e334 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1025,6 +1025,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
>          sd )
>              load_opt="load mmc 0:1"
>              ;;
> +        virtio )
> +            load_opt="load virtio 0:1"
> +            ;;
>          usb )
>              load_opt="fatload usb 0:1"
>              ;;
> -- 
> 2.39.1
> 

