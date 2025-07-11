Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE1B01128
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 04:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040121.1411579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua3Kk-0005l9-CJ; Fri, 11 Jul 2025 02:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040121.1411579; Fri, 11 Jul 2025 02:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua3Kk-0005ir-8w; Fri, 11 Jul 2025 02:17:54 +0000
Received: by outflank-mailman (input) for mailman id 1040121;
 Fri, 11 Jul 2025 02:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LlY=ZY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ua3Ki-0005il-8G
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 02:17:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dff50c3-5dfd-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 04:17:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE4995C6F84;
 Fri, 11 Jul 2025 02:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26799C4CEE3;
 Fri, 11 Jul 2025 02:17:47 +0000 (UTC)
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
X-Inumbo-ID: 3dff50c3-5dfd-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752200268;
	bh=ryoaSlvECCBiubjzOARp31PwTPgXOrW/8qnHd7KKqE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V4J5JHYs0Ltuh2h23dy0OjPR5ujrtImgD83J7cFY1xEHRwNAY99iEZY+yBCZlcEEO
	 0M/3eifgLoDaZR0LMeR1Tl5OPEprsT3eiaQqMM1k+XoLYPHzDwBZYQbSovzF7tQDoz
	 DmrkFKOHPmxuLDGn2xa1zf+qeswgOe5I38HhfuzeFAZeqAXfNvRDfNsmA7oIIaqWV5
	 xo89S1ul0/HHHGG19uuja4ZTNZXU+AAzPZOn4Hsj86Bs/Lq51voX3nVy+o95kuopRH
	 MDkvSTsAG69NqzG/Vj+TYExnS/su07cXriL7Y1qM69sv+T1h5VRMpkoj7dtrNq+rI6
	 huJQfIq6K2asg==
Date: Thu, 10 Jul 2025 19:17:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
In-Reply-To: <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507101752590.605088@ubuntu-linux-20-04-desktop>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com> <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Jul 2025, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states that: "Identifiers shall
> be distinct from macro names".
> 
> Update ECLAIR configuration to deviate:
> - clashes in 'xen/include/xen/bitops.h';
> - clashes in 'xen/include/xen/irq.h';
> - clashes in 'xen/common/grant_table.c'.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Hi Dmytro,

I tried to apply the patch and run a pipeline but it only results clean
on ARM but not on x86. There are 2087 outstanding violations:

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1919889048

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp1-1/X86_64/10644506983/PROJECT.ecd;/by_service/MC3A2.R5.5.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}


Jan, Andrew, Roger,

About half of them are from bitops.h which could be deviated the same
way xen/include/xen/bitops.h is deviated in this patch.

xen/arch/x86/include/asm/x86_64/page.h:virt_to_maddr could be deviated
too.

I don't know how to handle the rest or even how to configure the
deviation in Eclair. These are the results with those two deviations
added:

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/ppp1-2/X86_64/10644744316/PROJECT.ecd;/by_service/MC3A2.R5.5.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}

We only have 49 left. Any suggestions on how to handle them so that we
can mark the rule as "clean" and stop future regressions in the CI
loop?


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  docs/misra/deviations.rst                        | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index e8f513fbc5..a5d7b00094 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -117,6 +117,14 @@ it defines would (in the common case) be already defined. Peer reviewed by the c
>  -config=MC3A2.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
>  -doc_end
>  
> +-doc_begin="Clashes between function names and macros are deliberate for bitops functions, pirq_cleanup_check, update_gnttab_par and parse_gnttab_limit functions
> +and needed to have a function-like macro that acts as a wrapper for the function to be called. Before calling the function,
> +the macro adds additional checks or adjusts the number of parameters depending on the configuration."
> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/include/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
> +-config=MC3A2.R5.5,reports+={deliberate, "any_area(all_loc(file(^xen/common/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limit)&&kind(function)))"}
> +-doc_end
> +
>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>  depending on the guest."
>  -config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 0d56d45b66..fe05e4062e 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -142,6 +142,14 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R5.5
> +     - Clashes between function names and macros are deliberate for bitops functions,
> +       pirq_cleanup_check, update_gnttab_par and parse_gnttab_limit functions and needed
> +       to have a function-like macro that acts as a wrapper for the function to be
> +       called. Before calling the function, the macro adds additional checks or
> +       adjusts the number of parameters depending on the configuration.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R5.6
>       - The type ret_t is deliberately defined multiple times depending on the
>         type of guest to service.
> -- 
> 2.43.0
> 

