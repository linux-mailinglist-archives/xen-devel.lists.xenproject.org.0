Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE267898C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483240.749271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4Na-0002Zj-IF; Mon, 23 Jan 2023 21:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483240.749271; Mon, 23 Jan 2023 21:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4Na-0002XY-FR; Mon, 23 Jan 2023 21:29:26 +0000
Received: by outflank-mailman (input) for mailman id 483240;
 Mon, 23 Jan 2023 21:29:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK4NZ-0002XS-E3
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 21:29:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d3983d-9b65-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 22:29:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DD6BB80DE1;
 Mon, 23 Jan 2023 21:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD88C433EF;
 Mon, 23 Jan 2023 21:29:21 +0000 (UTC)
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
X-Inumbo-ID: 01d3983d-9b65-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674509362;
	bh=Km89VvCrM4ipmAbAkoIqOMm1S2WE6/sE8KNzh0pK6jE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oy3Uru5h+3ZXmeEG6U4P8V52sH7j+yEI+Ncw2bFEmmILnrepDa2RwKKmTiN3YE3d0
	 iCu6JsraCimuP2mjtre91Qzn82UbeTXZgpjVNSfgqbj+2RAfOTlqrRnHXkEixSFmC4
	 Z22Hab6W7fA33BIp3q0iCnpcaeV0g91LAzrWBhUyc4a4HdhvM2lVZFRth00rgZ93xK
	 KFV1kBG2UTrWBkn2LxQ/QzHfbU6Z3w1B14f8PywIaQCeaz+im2FokdoA16p7VT59DI
	 JGluzGq+8Dbdo8Jz34mTM62GphFxRT1uaT1NVPrTAUxTOVFyZZEQHZZEnngFn8Sj4W
	 Oqp8gAN2FMCCw==
Date: Mon, 23 Jan 2023 13:29:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 01/22] xen/common: page_alloc: Re-order includes
In-Reply-To: <20221216114853.8227-2-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231327060.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-2-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Order the includes with the xen headers first, then asm headers and
> last public headers. Within each category, they are sorted alphabetically.
> 
> Note that the includes in protected by CONFIG_X86 hasn't been sorted
> to avoid adding multiple #ifdef.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

This patch doesn't apply as is any longer. Assuming it gets ported to
the latest staging appropriately:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ----
> 
>     I am open to add sort the includes protected by CONFIG_X86
>     and add multiple #ifdef if this is preferred.
> ---
>  xen/common/page_alloc.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 0c93a1078702..0a950288e241 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -120,27 +120,30 @@
>   *   regions within it.
>   */
>  
> +#include <xen/domain_page.h>
> +#include <xen/event.h>
>  #include <xen/init.h>
> -#include <xen/types.h>
> +#include <xen/irq.h>
> +#include <xen/keyhandler.h>
>  #include <xen/lib.h>
> -#include <xen/sched.h>
> -#include <xen/spinlock.h>
>  #include <xen/mm.h>
> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
>  #include <xen/param.h>
> -#include <xen/irq.h>
> -#include <xen/softirq.h>
> -#include <xen/domain_page.h>
> -#include <xen/keyhandler.h>
>  #include <xen/perfc.h>
>  #include <xen/pfn.h>
> -#include <xen/numa.h>
> -#include <xen/nodemask.h>
> -#include <xen/event.h>
> +#include <xen/types.h>
> +#include <xen/sched.h>
> +#include <xen/softirq.h>
> +#include <xen/spinlock.h>
> +
> +#include <asm/flushtlb.h>
> +#include <asm/numa.h>
> +#include <asm/page.h>
> +
>  #include <public/sysctl.h>
>  #include <public/sched.h>
> -#include <asm/page.h>
> -#include <asm/numa.h>
> -#include <asm/flushtlb.h>
> +
>  #ifdef CONFIG_X86
>  #include <asm/guest.h>
>  #include <asm/p2m.h>
> -- 
> 2.38.1
> 

