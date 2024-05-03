Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D88BB7EF
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 01:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716702.1118881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s322a-00071M-2j; Fri, 03 May 2024 23:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716702.1118881; Fri, 03 May 2024 23:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s322a-0006ys-03; Fri, 03 May 2024 23:10:08 +0000
Received: by outflank-mailman (input) for mailman id 716702;
 Fri, 03 May 2024 23:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s322Y-0006yl-TO
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 23:10:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45a11edb-09a2-11ef-909c-e314d9c70b13;
 Sat, 04 May 2024 01:10:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C60B6CE19F4;
 Fri,  3 May 2024 23:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C634C116B1;
 Fri,  3 May 2024 23:09:59 +0000 (UTC)
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
X-Inumbo-ID: 45a11edb-09a2-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714777801;
	bh=6PxtIfi8KoXxEHG86P/CF4wIiQfgD3UardnDwMZ6q9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hR+3LtXeZCaA7bBHIH+xChgx65hpOB/uq04427OidhSPVOC30DDTMe07jeiX15Yvr
	 5kPT9SHgLESxdknu8HsfFW7eRWcVOssN5PWAIhe/dCbBMw7mpbB+wSBqOoB3gwsgdJ
	 7Dvl4p7KK++KdbBiapUDWfRcqlSi58jx3A2/HhwToR94Zd49/MxbkPaRaMe8SxF20b
	 xM/ZKMYpKFXxgVJNRIRGogYbQmixrReJu1QqZnNZAxkDIpCZGLrvMDd/kYAbJMR3y+
	 UkOC8NVqBWaAmyZrKD9t3p1kVkt1zrO25QjGkrqTaHMlfjkpqwE6Js0cX6ma2g2bY0
	 qCkcZ3ojPh2kA==
Date: Fri, 3 May 2024 16:09:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 2/2] automation/eclair: add deviation for Rule 16.4
In-Reply-To: <d4670fa5bd7e33a915d5642cb78eb2eb33988819.1714727807.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405031609400.1151289@ubuntu-linux-20-04-desktop>
References: <cover.1714727807.git.federico.serafini@bugseng.com> <d4670fa5bd7e33a915d5642cb78eb2eb33988819.1714727807.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 May 2024, Federico Serafini wrote:
> MISRA C:2012 Rule 16.4 states that "Every switch statement shall have a
> default label".
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>  docs/misra/deviations.rst                        | 13 +++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d21f112a9b..f09ad71acf 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -384,6 +384,14 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>  -doc_end
>  
> +-doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
> +-config=MC3R1.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* has no `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
> +-doc_end
> +
> +-doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
> +-config=MC3R1.R16.4,switch_clauses+={deliberate,"switch(1)&&default(0)"}
> +-doc_end
> +
>  -doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
>  -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>  -doc_end
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index ed0c1e8ed0..39cc321a27 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -334,6 +334,19 @@ Deviations related to MISRA C:2012 Rules:
>           - /\* Fallthrough \*/
>           - /\* Fallthrough. \*/
>  
> +   * - R16.4
> +     - Switch statements having a controlling expression of enum type
> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
> +       which warns (and breaks the build as we use -Werror) if one of the enum
> +       labels is missing from the switch.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R16.4
> +     - A switch statement with a single switch clause and no default label may
> +       be used in place of an equivalent if statement if it is considered to
> +       improve readability.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R16.6
>       - A switch statement with a single switch clause and no default label may
>         be used in place of an equivalent if statement if it is considered to
> -- 
> 2.34.1
> 

