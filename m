Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B79636F2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 02:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785336.1194778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjTFd-0005WF-Ab; Thu, 29 Aug 2024 00:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785336.1194778; Thu, 29 Aug 2024 00:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjTFd-0005UF-7z; Thu, 29 Aug 2024 00:43:01 +0000
Received: by outflank-mailman (input) for mailman id 785336;
 Thu, 29 Aug 2024 00:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjTFc-0005U9-MI
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 00:43:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a21ef8fc-659f-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 02:42:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6765ACE0691;
 Thu, 29 Aug 2024 00:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D214C4CEC0;
 Thu, 29 Aug 2024 00:42:50 +0000 (UTC)
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
X-Inumbo-ID: a21ef8fc-659f-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724892171;
	bh=ane8Mm/0Ga+QsNQ1MUFX45+/BxKnxWZoecqhvqhEgq0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JtUDEA9qteyW+gtJVe84XXRPyYZy5h+No1IHAkHi4fIrE67qOHQ1YfrX6u6H20Rfu
	 zFdW6nK0GYb9N73LkDv+Lnqj0j6qxgdGhUDOnm5t2tgbU6u3Z5oVSXkdoGl6a+BL02
	 QcsE172cfCRNIvJkOixfkl0gcIJ9QL+nvhJIQYFXl3HbsJhKaTxTw6blUT4aBaVpbW
	 iukhEoNjHEvFbzZXkOg5pu2qYzoH+CufzQXpP6RqKERI3IFr49frC/Ry4Vv15KmkiP
	 H7DQHfLB9nv8eogEC9+cs7Qh/ExJybhbBhPSf9g6KyNN49wvUXGMpJnn5Xw6Q1X+fP
	 eqhcS7FhWUtvw==
Date: Wed, 28 Aug 2024 17:42:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH] xen/bitmap: remove comment-based deviations
In-Reply-To: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2408281741550.53815@ubuntu-linux-20-04-desktop>
References: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Aug 2024, Federico Serafini wrote:
> Update ECLAIR configuration of MISRA C:2012 Rule 20.7 ("Expressions
> resulting from the expansion of macro parameters shall be enclosed in
> parentheses") to tag as 'safe' the expansions of arguments surrounded
> by the following tokens: '{', '}' and ';'.
> 
> Remove redundant comment-based deviations.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

I am missing some context: is this done to cover other cases similar to
the one below (bitmap_allocate_region) or is this done only to get rid
of the three SAF-7-safe in-code comments?


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/deviations.rst                        | 5 +++++
>  xen/include/xen/bitmap.h                         | 3 ---
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 1aa8277066..f37329973f 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -565,6 +565,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
>  -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>  -doc_end
>  
> +-doc_begin="The expansion of an argument surrounded by tokens '{', '}' and ';' is safe."
> +-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
> +-doc_end
> +
>  -doc_begin="Uses of variadic macros that have one of their arguments defined as
>  a macro and used within the body for both ordinary parameter expansion and as an
>  operand to the # or ## operators have a behavior that is well-understood and
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index d51aa422b5..d529726464 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -512,6 +512,11 @@ Deviations related to MISRA C:2012 Rules:
>         refactoring it to add parentheses breaks its functionality.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R20.7
> +     - The expansion of an argument surrounded by tokens '{', '}' and ';' is
> +       safe.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R20.12
>       - Variadic macros that use token pasting often employ the gcc extension
>         `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
> diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
> index 5d668053b0..4b642cd420 100644
> --- a/xen/include/xen/bitmap.h
> +++ b/xen/include/xen/bitmap.h
> @@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>  #define bitmap_switch(nbits, zero, small, large)			  \
>  	unsigned int n__ = (nbits);					  \
>  	if (__builtin_constant_p(nbits) && !n__) {			  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		zero;							  \
>  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		small;							  \
>  	} else {							  \
> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>  		large;							  \
>  	}
>  
> -- 
> 2.34.1
> 

