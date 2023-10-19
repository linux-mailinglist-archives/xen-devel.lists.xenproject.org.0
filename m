Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A27CFF36
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619509.964693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVeR-0005Xl-Lf; Thu, 19 Oct 2023 16:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619509.964693; Thu, 19 Oct 2023 16:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVeR-0005Uk-Ib; Thu, 19 Oct 2023 16:13:35 +0000
Received: by outflank-mailman (input) for mailman id 619509;
 Thu, 19 Oct 2023 16:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtVeQ-0005UW-3j
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:13:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 712f3f64-6e9a-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 18:13:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A2E74CE2F83;
 Thu, 19 Oct 2023 16:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A10C433C7;
 Thu, 19 Oct 2023 16:13:24 +0000 (UTC)
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
X-Inumbo-ID: 712f3f64-6e9a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697732005;
	bh=M5Xh7zKav3Tv9iF3d/TT/YLrmHB9NHIZjCdrhGDsSWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m0a/oScBoNTdMSSYapjpec4kC7b5p1oBkVEL1jIjbUB0YPDymTgAAJkTtsceTkN/R
	 YQ78uywYs5jaT97DlnguhthXlG+Azz8Bq8NUeXkM8Ihf3diyfasYXG/SkRsK+QZLRu
	 mEpCuhywklDaeOaPXLzZZnvxGAdkLhnKUFiLjvYFpNFF9QwpC6XlJthJ1PFsriN/AO
	 nApDCykSlpwzv2yBUTJeCWLqJaEIaL59Tu4bgLoppH6HSUkRvoSd4Ofvp9tkA9BE71
	 F49P6dulf4ZxjlXoIyJQMtgwSjECVIKxrMkjrtjqf2VwDSrW0Nv0klW7BV0QSRLJaT
	 B6CM+AxxU53rQ==
Date: Thu, 19 Oct 2023 09:13:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Community Manager <community.manager@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in
 4.18 dev cycle
In-Reply-To: <20231019052050.1032492-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
References: <20231019052050.1032492-1-Henry.Wang@arm.com> <20231019052050.1032492-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 165c5caf9b..47e98f036f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     nodes using a device tree overlay binary (.dtbo).
>   - Introduce two new hypercalls to map the vCPU runstate and time areas by
>     physical rather than linear/virtual addresses.
> + - The project has now officially adopted 72 rules of MISRA-C.

I counted them again, they are 71 today. We have accepted 3 more
recently but for the CHANGELOG.md I would stick with what is on
docs/misra/rules.rst

Assuming 72 is changed to 71 on commit:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

