Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A1975E0A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 02:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796923.1206647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXnr-0006ms-5u; Thu, 12 Sep 2024 00:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796923.1206647; Thu, 12 Sep 2024 00:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXnr-0006kC-3E; Thu, 12 Sep 2024 00:35:19 +0000
Received: by outflank-mailman (input) for mailman id 796923;
 Thu, 12 Sep 2024 00:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soXnp-0006jX-Du
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 00:35:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0bcaba7-709e-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 02:35:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C29DB5C0354;
 Thu, 12 Sep 2024 00:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46C1C4CEC0;
 Thu, 12 Sep 2024 00:35:12 +0000 (UTC)
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
X-Inumbo-ID: e0bcaba7-709e-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726101314;
	bh=2f6mQXlUd1FBNCwSPcYwf0YiPlQTG7PIYKlXmYlQ/jU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E78DLXneSXdppbxPpLy2Se369LOXIzBZCDrXigIXaAkycsRr9fwsB6DVnWCWdcq9/
	 3RJrSTSDtbGMtE3Yy0vHI6rlx9bODKUc9qmzJHioYMTc1KQ5uCQ+Ulb6a4LedUhh/u
	 Dw8qKT9FbNO5qjGqUq21EFWoC8aqpnw+BC8NFCKl3Z8vgkPJ0YTyu0m9kaDsCwRfuU
	 /lXgmtEGb4D2ZYbECVCGRqBtDIYYB2mHn9kaSzUsPxTckrxUMZm68sxsn9OgO8Iy93
	 Jj8d8uFfHCP1rCb0rYPslsHbFhnFnV8PFZa9ftdIYDAFzUlvHSvyTMlkKHyMgoyKBu
	 539BoVhkGaRTA==
Date: Wed, 11 Sep 2024 17:35:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 1/2] automation/eclair: update configuration of
 Rule 20.7
In-Reply-To: <2e77768c0f0e4c3cdae099201bcceca635158bf8.1725963889.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2409111735030.611587@ubuntu-linux-20-04-desktop>
References: <cover.1725963889.git.federico.serafini@bugseng.com> <2e77768c0f0e4c3cdae099201bcceca635158bf8.1725963889.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Sep 2024, Federico Serafini wrote:
> MISRA C:2012 Rule 20.7 states that "Expressions resulting from the
> expansion of macro parameters shall be enclosed in parentheses".
> The rational of the rule is that if a macro argument expands to an
> expression, there may be problems related to operator precedence, e.g.,
> 
> define M(A, B) A * B
> 
> M(1+1, 2+2) will expand to: 1+1 * 2+2
> 
> Update ECLAIR configuration to tag as 'safe' the expansions of macro
> arguments surrounded tokens '{', '}' and ';', since in their presence
> problems related to operator precedence can not occur.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v1:
> - more details to justify the deviation;
> - split modifications in two patches.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/deviations.rst                        | 5 +++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9051f41602..e0d9426b7a 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -581,6 +581,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
>  -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>  -doc_end
>  
> +-doc_begin="Problems related to operator precedence can not occur if the expansion of the macro argument is surrounded by tokens '{', '}' and ';'."
> +-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
> +-doc_end
> +
>  -doc_begin="Uses of variadic macros that have one of their arguments defined as
>  a macro and used within the body for both ordinary parameter expansion and as an
>  operand to the # or ## operators have a behavior that is well-understood and
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index b66c271c4e..69f93a6a91 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -534,6 +534,11 @@ Deviations related to MISRA C:2012 Rules:
>         refactoring it to add parentheses breaks its functionality.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R20.7
> +     - Problems related to operator precedence can not occur if the expansion
> +       of the macro argument is surrounded by tokens '{', '}' and ';'.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R20.12
>       - Variadic macros that use token pasting often employ the gcc extension
>         `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
> -- 
> 2.34.1
> 

