Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497491988D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 21:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749445.1157532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMYg2-0004FK-7y; Wed, 26 Jun 2024 19:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749445.1157532; Wed, 26 Jun 2024 19:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMYg2-0004Cq-5I; Wed, 26 Jun 2024 19:51:34 +0000
Received: by outflank-mailman (input) for mailman id 749445;
 Wed, 26 Jun 2024 19:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMYg0-0004Ck-4u
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 19:51:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a7cc4a5-33f5-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 21:51:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2660E61CE4;
 Wed, 26 Jun 2024 19:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2D9C32789;
 Wed, 26 Jun 2024 19:51:26 +0000 (UTC)
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
X-Inumbo-ID: 7a7cc4a5-33f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719431488;
	bh=n6kgE0l52XU5oU9eMCS8iv4dzcvW7V5pRFUTSJX/ofA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gkVpGWCWu6AU7fmwGKnI6FsaNt93rflTi1p8HDkB9qSO28l7NBd/WvNbZexof5cbk
	 fmbSfYwH82wVTh+Q5qaSkJreh24kY5b02dC5I0CO/2C47ZPenrv3AOkbGzafNz7mcz
	 Dg5GRlIf7p2RA+8xwN4TL/bjvi2xonMs8ybJmK73eqFGh8Uz9M3CXKoFUmGJ/xzMiy
	 QIq/KVdwniDj0cAK/YerOHTZ3c0ptGtpy1dBtzUsKW3JiDCNfKtLaCYf1yOif1SCk+
	 QjwVQUVrdlU+WZwuRS1SPFwGxBezOJFHLaKodT6jcxadqfeONE/5/xwq620P6Chm/p
	 nHHyL8XBTQ9vQ==
Date: Wed, 26 Jun 2024 12:51:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Step down as maintainer and committer
In-Reply-To: <20240626151935.26704-1-george.dunlap@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2406261249540.3635@ubuntu-linux-20-04-desktop>
References: <20240626151935.26704-1-george.dunlap@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, George Dunlap wrote:
> Remain a Reviewer on the golang bindings and scheduler for now (using
> a xenproject.org alias), since there may be architectural decisions I
> can shed light on.
> 
> Remove the XENTRACE section entirely, as there's no obvious candidate
> to take it over; having the respective parts fall back to the tools
> and The Rest seems the most reasonable option.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Thanks for all your efforts over the years! You should be listed as
"Committer Emeritus".

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Nick Rosbrook <rosbrookn@gmail.com>
> ---
>  MAINTAINERS | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d66b898ec..2b0c894527 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -325,8 +325,8 @@ F:	xen/arch/x86/debug.c
>  F:	tools/debugger/gdbsx/
>  
>  GOLANG BINDINGS
> -M:	George Dunlap <george.dunlap@citrix.com>
>  M:	Nick Rosbrook <rosbrookn@gmail.com>
> +R:	George Dunlap <gwd@xenproject.org>
>  S:	Maintained
>  F:	tools/golang
>  
> @@ -490,9 +490,9 @@ S:	Supported
>  F:	xen/common/sched/rt.c
>  
>  SCHEDULING
> -M:	George Dunlap <george.dunlap@citrix.com>
>  M:	Dario Faggioli <dfaggioli@suse.com>
>  M:	Juergen Gross <jgross@suse.com>
> +R:	George Dunlap <gwd@xenproject.org>
>  S:	Supported
>  F:	xen/common/sched/
>  
> @@ -597,7 +597,6 @@ F:	tools/tests/x86_emulator/
>  X86 MEMORY MANAGEMENT
>  M:	Jan Beulich <jbeulich@suse.com>
>  M:	Andrew Cooper <andrew.cooper3@citrix.com>
> -R:	George Dunlap <george.dunlap@citrix.com>
>  S:	Supported
>  F:	xen/arch/x86/mm/
>  
> @@ -641,13 +640,6 @@ F:	tools/libs/store/
>  F:	tools/xenstored/
>  F:	tools/xs-clients/
>  
> -XENTRACE
> -M:	George Dunlap <george.dunlap@citrix.com>
> -S:	Supported
> -F:	tools/xentrace/
> -F:	xen/common/trace.c
> -F:	xen/include/xen/trace.h
> -
>  XEN MISRA ANALYSIS TOOLS
>  M:	Luca Fancellu <luca.fancellu@arm.com>
>  S:	Supported
> @@ -670,7 +662,6 @@ K:	\b(xsm|XSM)\b
>  
>  THE REST
>  M:	Andrew Cooper <andrew.cooper3@citrix.com>
> -M:	George Dunlap <george.dunlap@citrix.com>
>  M:	Jan Beulich <jbeulich@suse.com>
>  M:	Julien Grall <julien@xen.org>
>  M:	Stefano Stabellini <sstabellini@kernel.org>
> -- 
> 2.25.1
> 

