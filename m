Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A631F9D1C41
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 01:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839624.1255410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDC1e-0000QI-2L; Tue, 19 Nov 2024 00:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839624.1255410; Tue, 19 Nov 2024 00:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDC1d-0000Of-Ve; Tue, 19 Nov 2024 00:23:25 +0000
Received: by outflank-mailman (input) for mailman id 839624;
 Tue, 19 Nov 2024 00:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDC1d-0000OZ-H9
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 00:23:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a3f0891-a60c-11ef-a0c9-8be0dac302b0;
 Tue, 19 Nov 2024 01:23:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67BF75C5D7B;
 Tue, 19 Nov 2024 00:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D7DC4CED7;
 Tue, 19 Nov 2024 00:23:17 +0000 (UTC)
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
X-Inumbo-ID: 7a3f0891-a60c-11ef-a0c9-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjdhM2YwODkxLWE2MGMtMTFlZi1hMGM5LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTc1ODAwLjUxMjgxMywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731975798;
	bh=ix4h+30Wcvi+mZUToRZaMUZqndzHDAsNk3g5oGGJjEU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=biBSTjlJQXT19/fK62Jb7zeBBSsi1xO2YRSlpAKif2bJfsus9g6xZeSUW357qYnfS
	 7RLiLI1bej3MFsRAA5fCEUq7ya6Guolzh+Ze1MMX/q+BhMJ4yVnxPgsVlsQGBKKsEQ
	 wT83TOMufAs1Qc9RZFabFQXypeTpeBEdAbIYWlUNCtoHZvxPojuZsNNwkEZ1amemUB
	 uaX3xZ59BrrzlDDJC3cBSDAEwYx2PdeRubfVzqROaDzsFZeXxfYgTiggTeLWLWz9CY
	 Kkc4y8GObnjN5dalKTQnZ6Svab29fux3Sb1x0zZwG3/8QBcMJyg0ZE3zKyXVUjhWKb
	 8JELuW29EopzA==
Date: Mon, 18 Nov 2024 16:23:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Miccio <luca.miccio@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [ImageBuilder] UBOOT_SOURCE/SCRIPTS variables must always be
 set
In-Reply-To: <20241118141205.3513831-1-luca.miccio@amd.com>
Message-ID: <alpine.DEB.2.22.394.2411181620500.1160299@ubuntu-linux-20-04-desktop>
References: <20241118141205.3513831-1-luca.miccio@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Nov 2024, Luca Miccio wrote:
> The current README incorrectly omits the need for the UBOOT_SOURCE and
> UBOOT_SCRIPT variables for uboot-script-gen to function properly.
> Moreover, the script silently fails if these variables are not set.
> Return an error if the the UBOOT_SCRIPT variable is not set and
> correct the documentation accordingly.
> 
> Signed-off-by: Luca Miccio <luca.miccio@amd.com>
> ---
>  README.md                |  3 ++-
>  scripts/uboot-script-gen | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index 4fcd908..ae2fdfd 100644
> --- a/README.md
> +++ b/README.md
> @@ -272,7 +272,8 @@ Where:
>  
>  - UBOOT_SOURCE and UBOOT_SCRIPT specify the output. They are optional
>    as you can pass -o FILENAME to uboot-script-gen as a command line
> -  parameter
> +  parameter. It has to be set either in the config file or CLI argument
> +  though.
>  
>  - APPEND_EXTRA_CMDS: is optional and specifies the path to a text file
>    containing extra u-boot commands to be added to the boot script before
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index dcf5bdb..b07cbf1 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1210,6 +1210,18 @@ then
>      UBOOT_SCRIPT="$uboot_out_opt".scr
>      UBOOT_SOURCE="$uboot_out_opt".source
>  fi
> +
> +if test ! "$UBOOT_SOURCE"
> +then
> +    echo "UBOOT_SOURCE not set, either specify it in the config or set it with the -o option"
> +    exit 1
> +fi
> +
> +if test ! "$UBOOT_SCRIPT"
> +then
> +    UBOOT_SCRIPT="$UBOOT_SCRIPT".scr

This doesn't look right? Did you mean:

  UBOOT_SCRIPT="${UBOOT_SOURCE%.source}.scr"


> +fi
> +
>  if test "$fit_opt" && ! test "$FIT"
>  then
>      FIT="${UBOOT_SOURCE%.source}.fit"
> -- 
> 2.34.1
> 

