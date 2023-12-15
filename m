Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2756815188
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:03:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655377.1023178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKv-0005qQ-3K; Fri, 15 Dec 2023 21:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655377.1023178; Fri, 15 Dec 2023 21:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFKv-0005ny-00; Fri, 15 Dec 2023 21:03:09 +0000
Received: by outflank-mailman (input) for mailman id 655377;
 Fri, 15 Dec 2023 21:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFKt-0002dN-GL
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:03:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 575f6fc5-9b8d-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 22:03:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7B6BCE2D95;
 Fri, 15 Dec 2023 21:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8482C433C8;
 Fri, 15 Dec 2023 21:03:02 +0000 (UTC)
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
X-Inumbo-ID: 575f6fc5-9b8d-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674184;
	bh=xAVz5tJ8KI4Ofi8ERilBIDhJejnxCzaIifNeF/zGzm0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CY3XZ7MWZi2bDSK4hlfcLULPDGoLEWol5N/u6UIGbW+JCSprD1MxroL04Og+opI23
	 D0TDzSs3w4cgK5y4Yw0plzxim+PeBtfO1fBZuksCZarsACmB6mc+E+3++nwxSbFZ3S
	 AZ1yUeFC1QESqCSgQEwa+DPW93lzAZmdkXYibdCpLDDx7t3iH4TOlI7QVYRBx5ghp7
	 3zRMJ2LEI65Z4X0c9ZIjJ4eVq0b/tRdlxfpZ4p2E3e2jQnUjNyE/EzoxhRhSDlleFy
	 v+pDSsWIGyDQ7emWO1YWOF4sofGwBZhVYUhuI6A7qLcSNyUQku0jUM8TqBmYa4Lawj
	 0K06/+QjAFWRA==
Date: Fri, 15 Dec 2023 13:03:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
In-Reply-To: <7b07ed4a2a87c2774b469eb0fa280c19f945b3a4.1702631924.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312151258360.3175268@ubuntu-linux-20-04-desktop>
References: <7b07ed4a2a87c2774b469eb0fa280c19f945b3a4.1702631924.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Dec 2023, Federico Serafini wrote:
> MISRA C:2012 Rule 16.3 states that an unconditional break statement
> shall terminate every switch-clause.
> 
> Update ECLAIR configuration to take into account:
>   - continue, goto, return statements;
>   - functions that do not give the control back;
>   - fallthrough pseudo-keyword;
>   - macro BUG();
>   - comments.
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

This is much sharper and better than before, thanks Federico!


> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 28 +++++++++++++++++++
>  docs/misra/deviations.rst                     | 28 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 683f2bbfe8..e27d840fe4 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -327,6 +327,34 @@ therefore have the same behavior of a boolean"
>  -config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
>  -doc_end
>  
> +#
> +# Series 16.
> +#
> +
> +-doc_begin="Switch clauses ending with continue, goto, return statements are
> +safe."
> +-config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with a call to a function that does not give
> +the control back are safe."
> +-config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
> +safe."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/fallthrough;/))))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses ending with failure method \"BUG()\" are safe."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
> +-doc_end
> +
> +-doc_begin="Switch clauses not ending with the break statement are safe if an
> +explicit comment indicating the fallthrough intention is present."
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
> +-doc_end
> +
>  #
>  # Series 20.
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index eda3c8100c..d593be81b9 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -276,6 +276,34 @@ Deviations related to MISRA C:2012 Rules:
>         therefore have the same behavior of a boolean.
>       - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>  
> +   * - R16.3
> +     - Switch clauses ending with continue, goto, return statements are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses ending with a call to a function that does not give
> +       the control back are safe.

NIT: it might be good to add:

  (noreturn)

to the statement for clarity but it is good enough already


> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Switch clauses ending with failure method \"BUG()\" are safe.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R16.3
> +     - Existing switch clauses not ending with the break statement are safe if
> +       an explicit comment indicating the fallthrough intention is present.
> +       However, the use of such comments in new code is deprecated:
> +       pseudo-keyword "fallthrough" shall be used.

          ^NIT: the pseudo-keyword

both changes could be done on commit

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +     - Tagged as `safe` for ECLAIR. The accepted comments are:
> +         - /\* fall through \*/
> +         - /\* fall through. \*/
> +         - /\* fallthrough \*/
> +         - /\* fallthrough. \*/
> +         - /\* Fall through \*/
> +         - /\* Fall through. \*/
> +         - /\* Fallthrough \*/
> +         - /\* Fallthrough. \*/
> +
>     * - R20.7
>       - Code violating Rule 20.7 is safe when macro parameters are used:
>         (1) as function arguments;
> -- 
> 2.34.1
> 

