Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2757B0FAA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 01:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609186.948120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleKj-0003Gk-SH; Wed, 27 Sep 2023 23:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609186.948120; Wed, 27 Sep 2023 23:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qleKj-0003FO-PI; Wed, 27 Sep 2023 23:52:45 +0000
Received: by outflank-mailman (input) for mailman id 609186;
 Wed, 27 Sep 2023 23:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qleKi-0002zs-6P
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 23:52:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2f0bdd7-5d90-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 01:52:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 50E1FB81907;
 Wed, 27 Sep 2023 23:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F841C433C9;
 Wed, 27 Sep 2023 23:52:40 +0000 (UTC)
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
X-Inumbo-ID: f2f0bdd7-5d90-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695858761;
	bh=6nHPpORlUP7QGEbOcj+UStECZkv7qzsx8Tsiz3wPVII=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WqK1eSnUAknxHewh5QiYxrlaXNUP1me4ZdBIdUUenOiUMmsfzDUbVxkkC+2mz5U2m
	 eyoAn4ybCKrMoaSIGyhZ0nx+rAEeduAOdRCHhsESj1QNnmU+osY8fjPTsfJkExUALb
	 diCHC0m5/UrmwgcQ4aXuk8YaZWUpsaeOANFF8Aq0i2v1KsXLGj0TY/4OVHy3rsIzQz
	 Q1aT+/49BJFEdkP0NEWaYdvBYkWSEXuIEwdIaO3PieD7V9jkHjqwlLNXnNNv4Trrfu
	 CySZQm7kuZvz3SwT01xrD/SjDesmCNEepdUY0kE26f1Wu2hrzriOVGo/gDIIyu41o1
	 BjgpzCDiH462g==
Date: Wed, 27 Sep 2023 16:52:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org, 
    george.dunlap@citrix.com, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] docs/misra: add 14.3
In-Reply-To: <20230908202723.1641469-1-sstabellini@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2309271649120.1403502@ubuntu-linux-20-04-desktop>
References: <20230908202723.1641469-1-sstabellini@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Henry,

This patch is now acked. Should it go in 4.18?

In terms of risk of breaking, it is zero as nothing builds or runs based
on this document.

At the same time, the benefit is also low because the main value of this
document is for future coding changes that would be too late now for
4.18. So the benefits of committing it now are ease of keeping track of
the change and positive PR when we make the 4.18 release and we talk
about the total number of MISRA C rules we adopted.



On Fri, 8 Sep 2023, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Add 14.3, with project-wide deviations.
> 
> Also take the opportunity to clarify that parameters of function pointer
> types are expected to have names (Rule 8.2).
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v3:
> - add ,
> - add switch(sizeof(...)) and switch(offsetof(...))
> ---
>  docs/misra/rules.rst | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 34916e266a..ac76e20a9c 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -234,7 +234,8 @@ maintainers if you want to suggest a change.
>     * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
>       - Required
>       - Function types shall be in prototype form with named parameters
> -     -
> +     - Clarification: both function and function pointers types shall
> +       have named parameters.
>  
>     * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
>       - Required
> @@ -385,6 +386,18 @@ maintainers if you want to suggest a change.
>       - A loop counter shall not have essentially floating type
>       -
>  
> +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> +     - Required
> +     - Controlling expressions shall not be invariant
> +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> +       checks, and other constructs that are detected as errors by MISRA
> +       C scanners, managing the configuration of a MISRA C scanner for
> +       this rule would be unmanageable. Thus, this rule is adopted with
> +       a project-wide deviation on if, ?:, switch(sizeof(...)), and
> +       switch(offsetof(...)) statements.
> +
> +       while(0) and while(1) and alike are allowed.
> +
>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>       - Required
>       - A switch-expression shall not have essentially Boolean type
> -- 
> 2.25.1
> 

