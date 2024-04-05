Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56CF899290
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701051.1095110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXNC-0005Al-Gl; Fri, 05 Apr 2024 00:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701051.1095110; Fri, 05 Apr 2024 00:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXNC-00057u-Dd; Fri, 05 Apr 2024 00:24:02 +0000
Received: by outflank-mailman (input) for mailman id 701051;
 Fri, 05 Apr 2024 00:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXNB-00057o-Ml
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:24:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb4a6d9d-f2e2-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 02:23:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F830CE3531;
 Fri,  5 Apr 2024 00:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC97C433C7;
 Fri,  5 Apr 2024 00:23:52 +0000 (UTC)
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
X-Inumbo-ID: cb4a6d9d-f2e2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712276634;
	bh=Inc3BTBxcJgkwrRPNJvHzcmhP8p/ET1/Qb9nUtjIqSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LOYM2obg2oYkps30G+3FANryVDjlpQlamZIkQB7HpcLUwsEP++1QVq10xX74FwzhS
	 OZ0Kmm2Sr2YjLvxi6YjobCGIfXAI+g9UNx6mfLatmEfyaSXR9Xx+ynsOC9XezUiTBn
	 AVbuDP7K90QJIKeBgmYh3D/rrVN8Z1rJ7gEuzIR+uCvxKxeftgMBjr/H8tOct0yhOE
	 NSaVtu6KpxUPX35jNKY20SaEXdRf0S/i06bX3TEzW0k+PqlhRwuEQ1EcxwHFPAnJ/j
	 WKhtCxnqP+OypB8SH5viFCKuJTQvSTi680OrignCuszZOxMuNz6Kf1fPqn/r4KPsnO
	 BWc/CHoKGXYFQ==
Date: Thu, 4 Apr 2024 17:23:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: John Ernberg <john.ernberg@actia.se>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Become a reviewer of iMX8Q{M,XP}
 related patches
In-Reply-To: <20240328163351.64808-4-john.ernberg@actia.se>
Message-ID: <alpine.DEB.2.22.394.2404041723250.2245130@ubuntu-linux-20-04-desktop>
References: <20240328163351.64808-1-john.ernberg@actia.se> <20240328163351.64808-4-john.ernberg@actia.se>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Mar 2024, John Ernberg wrote:
> I have experience with the IMX8QXP, and the supported parts of the IMX8QM
> are identical.
> 
> Help review patches touching these areas.

You need to add a signed-off-by. With that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> 
> v3:
>  - New patch (Bertrand Marquis)
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bd22fd75f..09982241b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -337,6 +337,11 @@ F:	tools/misc/xenhypfs.c
>  F:	xen/common/hypfs.c
>  F:	xen/include/xen/hypfs.h
>  
> +IMX8QM/QXP SUPPORT
> +R:	John Ernberg <john.ernberg@actia.se>
> +F:	xen/arch/arm/platforms/imx8qm.c
> +F:	xen/drivers/char/imx-lpuart.c
> +
>  INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
>  R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
> -- 
> 2.44.0
> 

