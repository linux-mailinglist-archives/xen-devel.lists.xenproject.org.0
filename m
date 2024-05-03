Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774298BB7EA
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 01:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716698.1118872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3217-0005RH-Ou; Fri, 03 May 2024 23:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716698.1118872; Fri, 03 May 2024 23:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3217-0005Pa-La; Fri, 03 May 2024 23:08:37 +0000
Received: by outflank-mailman (input) for mailman id 716698;
 Fri, 03 May 2024 23:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s3216-0005PI-DA
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 23:08:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102824fa-09a2-11ef-b4bb-af5377834399;
 Sat, 04 May 2024 01:08:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D9D0761D7F;
 Fri,  3 May 2024 23:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C67C116B1;
 Fri,  3 May 2024 23:08:31 +0000 (UTC)
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
X-Inumbo-ID: 102824fa-09a2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714777712;
	bh=ucQuWwuCgUwlFtaL8XCybyxB/OxABFPKf8TbbSa01A8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cPA7/IM7yOyF6GVpwA2KbPO3Q+rrJQwb2OM4Ts4PeHzs4v2Aso/MWj0WZoi2Fu9Yv
	 xIVpEyyctmQbgZEVwyNHUftqAG72nUnPrbrB4u7TTwZwaRslfC5khnLs26nNX9dSou
	 VNIjTkFCF3hSpb07fdFXpUqRSf52phFrktnAVw5yFsnqdVN4YtKOLGylKD5vxPrbyk
	 Z95m1ONp/G9L4jPADwdCjBOc4D4JAoqUBrzb1+x1DdnYHuxos5+sgmY+ImCz9nHdJY
	 VDBKyFc7aUsY0ln6N1D7hki7KqktpczxoSo4X0+hyNzqO2YzpWe6TpHcC1BiDQq8sR
	 KfwnAPhek0IdQ==
Date: Fri, 3 May 2024 16:08:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/2] docs/misra: add Terms & Definitions section to
 rules.rst
In-Reply-To: <05d9d4b4319f28d602b7366f2964c451a3a50ce3.1714727807.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405031608220.1151289@ubuntu-linux-20-04-desktop>
References: <cover.1714727807.git.federico.serafini@bugseng.com> <05d9d4b4319f28d602b7366f2964c451a3a50ce3.1714727807.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 May 2024, Federico Serafini wrote:
> Add a section for terms and definitions used by MISRA but expressed
> in terms of the C specification.
> 
> Add a definition of "switch clause" to the newly-introduced section.
> 
> Link the first use of the term "switch clause" in the document to its
> definition.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Jan you were not completely satisfied by the definition but I didn't find
> a better one.
> ---
>  docs/misra/rules.rst | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index b7b447e152..d3b70fdf04 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -489,8 +489,7 @@ maintainers if you want to suggest a change.
>  
>     * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
>       - Required
> -     - An unconditional break statement shall terminate every
> -       switch-clause
> +     - An unconditional break statement shall terminate every switch-clause_
>       - In addition to break, also other unconditional flow control statements
>         such as continue, return, goto are allowed.
>  
> @@ -712,3 +711,14 @@ maintainers if you want to suggest a change.
>       - The value of a pointer to a FILE shall not be used after the associated
>         stream has been closed
>       -
> +
> +Terms & Definitions
> +-------------------
> +
> +.. _switch-clause:
> +
> +A *switch clause* can be defined as:
> +"the non-empty list of statements which follows a non-empty list of
> +case/default labels".
> +A formal definition is available within the amplification of MISRA C:2012
> +Rule 16.1.
> -- 
> 2.34.1
> 

