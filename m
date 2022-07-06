Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF765692ED
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 21:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362494.592534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9B9r-0001jP-D9; Wed, 06 Jul 2022 19:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362494.592534; Wed, 06 Jul 2022 19:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9B9r-0001hD-9t; Wed, 06 Jul 2022 19:57:59 +0000
Received: by outflank-mailman (input) for mailman id 362494;
 Wed, 06 Jul 2022 19:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9B9p-0001h3-EP
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 19:57:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed662ea0-fd65-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 21:57:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 874CEB81EB7;
 Wed,  6 Jul 2022 19:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D749DC3411C;
 Wed,  6 Jul 2022 19:57:53 +0000 (UTC)
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
X-Inumbo-ID: ed662ea0-fd65-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657137474;
	bh=SeI7GIhNWV7ePymEjCfbIYEMXriY2YCHmjJZCxyfDxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IcN8pAbcYWCwbcPmW8kIUzZsGHuLivkS/NygFxlX3oFLRlxayeu76itJqVdHo//5y
	 +R9sePkj+NT/TJoFbkq88rv1EV8p72gzYAgP48XVjQ+qRFR1ixle8IE9/wpHz/J4zt
	 kxAnvdGUYLk1lnt2QVxGrmQMtAn0Xob5b/DPj2Ojvy+U6KW2wfUOF/L+Xw90MEZtf4
	 6FoVArPQzymSwU7AnCzT4O/1VUlCG/IZiG9mhZEqF4fQc28AeNF3ASvXpPb0sd5Cks
	 foJJYkJx+eCCTGibglXKib/3xborNeqa99MwCfEqDRmmBvPjbHqaH1iYxsgYRniOPh
	 J8/QrY36543dA==
Date: Wed, 6 Jul 2022 12:57:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@citrix.com>
cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] MAINTAINERS: Make Daniel P. Smith sole XSM maintainer
In-Reply-To: <20220706135245.64915-1-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2207061257450.2354836@ubuntu-linux-20-04-desktop>
References: <20220706135245.64915-1-george.dunlap@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Jul 2022, George Dunlap wrote:
> While mail hasn't been bouncing, Daniel De Graaf has not been
> responding to patch submissions or otherwise interacting with the
> community for several years.  Daniel Smith has at least been working
> with the code, and is a regular member of our community; and he has
> agreed to step up into the role.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a99526784..e12c499a28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -649,8 +649,7 @@ F:	xen/common/trace.c
>  F:	xen/include/xen/trace.h
>  
>  XSM/FLASK
> -M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
> -R:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +M:	Daniel P. Smith <dpsmith@apertussolutions.com>
>  S:	Supported
>  F:	tools/flask/
>  F:	xen/include/xsm/
> -- 
> 2.25.1
> 

