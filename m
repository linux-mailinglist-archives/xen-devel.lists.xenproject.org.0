Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D365366E1
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 20:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338109.562863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuebd-0008H6-CY; Fri, 27 May 2022 18:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338109.562863; Fri, 27 May 2022 18:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuebd-0008EX-9L; Fri, 27 May 2022 18:22:37 +0000
Received: by outflank-mailman (input) for mailman id 338109;
 Fri, 27 May 2022 18:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nuebb-0008EQ-SQ
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 18:22:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa88d5df-dde9-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 20:22:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56906B824C9;
 Fri, 27 May 2022 18:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E6BC385B8;
 Fri, 27 May 2022 18:22:31 +0000 (UTC)
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
X-Inumbo-ID: fa88d5df-dde9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653675752;
	bh=UVSKD2w56mlgEfl0ZkR/dT7q4SzsY8P7MtcC6hyVt4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FBMFjtrTweZvKQFVAxphG1CDiAY+UMSzNV94KtF/E3dlHO1gF7YQRgC/pyOB/2MpA
	 39zYOT5gwiktxPhHhhFV8TPnU5zVpdSvvGimJHs3Z2uYMQvsU02MqD53OCLr9U+5gc
	 Iot2xVFpU4tjBiEJoirx8TITsWTS+PhdKKen+NDOu84BQvWK1w0kU1VgbJmO7vDte5
	 Tev+i4n9scPLMjMyCDZ/9Q+My1Q6//r25InI3VHuSEgW/NvE44FKbhn+5ovtvvvIkj
	 sHUx+twY46NE6DLb/vR1DnJaqf0b2ZkiUKylQbogUog1uxQE39kwMKgRuNqVzRIqg1
	 xBci/c+3xeXFQ==
Date: Fri, 27 May 2022 11:22:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com
Subject: Re: [PATCH] MAINTAINERS: Update Xen maintainership
In-Reply-To: <1653674225-10447-1-git-send-email-boris.ostrovsky@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2205271122230.1905099@ubuntu-linux-20-04-desktop>
References: <1653674225-10447-1-git-send-email-boris.ostrovsky@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 May 2022, Boris Ostrovsky wrote:
> Due to time constraints I am stepping down as maintainter. I will stay
> as reviewer for x86 code (for which create a separate category).
> 
> Stefano is now maintainer for Xen hypervisor interface and Oleksandr has
> graciously agreed to become a reviewer.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6d879cb0afd..b879c4e6750e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21549,23 +21549,29 @@ F:	arch/arm64/include/asm/xen/
>  F:	arch/arm64/xen/
>  
>  XEN HYPERVISOR INTERFACE
> -M:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
>  M:	Juergen Gross <jgross@suse.com>
> -R:	Stefano Stabellini <sstabellini@kernel.org>
> +M:	Stefano Stabellini <sstabellini@kernel.org>
> +R:	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>  L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
>  F:	Documentation/ABI/stable/sysfs-hypervisor-xen
>  F:	Documentation/ABI/testing/sysfs-hypervisor-xen
> -F:	arch/x86/include/asm/pvclock-abi.h
> -F:	arch/x86/include/asm/xen/
> -F:	arch/x86/platform/pvh/
> -F:	arch/x86/xen/
>  F:	drivers/*/xen-*front.c
>  F:	drivers/xen/
>  F:	include/uapi/xen/
>  F:	include/xen/
>  
> +XEN HYPERVISOR X86
> +M:	Juergen Gross <jgross@suse.com>
> +R:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
> +L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
> +S:	Supported
> +F:	arch/x86/include/asm/pvclock-abi.h
> +F:	arch/x86/include/asm/xen/
> +F:	arch/x86/platform/pvh/
> +F:	arch/x86/xen/
> +
>  XEN NETWORK BACKEND DRIVER
>  M:	Wei Liu <wei.liu@kernel.org>
>  M:	Paul Durrant <paul@xen.org>
> -- 
> 1.8.3.1
> 

