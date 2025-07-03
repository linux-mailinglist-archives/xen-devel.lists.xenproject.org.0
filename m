Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F1EAF818D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 21:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032461.1406100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXPsG-0007Of-V6; Thu, 03 Jul 2025 19:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032461.1406100; Thu, 03 Jul 2025 19:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXPsG-0007M3-Ry; Thu, 03 Jul 2025 19:45:36 +0000
Received: by outflank-mailman (input) for mailman id 1032461;
 Thu, 03 Jul 2025 19:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uXPsG-0007Lx-9p
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 19:45:36 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47439f69-5846-11f0-a315-13f23c93f187;
 Thu, 03 Jul 2025 21:45:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBA2645DF1;
 Thu,  3 Jul 2025 19:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3F4C4CEE3;
 Thu,  3 Jul 2025 19:45:29 +0000 (UTC)
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
X-Inumbo-ID: 47439f69-5846-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751571930;
	bh=wbETRwerMCPoiBAmxwCM8Of6gjs6rueRp5eCyb/4Mjw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SAKgZXBDPbsgJKH7aq04nug+0LpxIkOIhxTy9qovkDsvpAEaD14RE3nwskHFWzSmN
	 58Ee2VgtE7BU6L4LJv4m2zUJ9t3jFC2qqMv5FCn+aolo2Stq28SouAWD1neYhq4ZXh
	 njsBLOBpZWFh25+qafnXBnCCkjOKhsUVjOSsNEpeGOL+QwlKMTSPiMEHEbt4OwaoyU
	 jYOmZUvfP9/kyjPMu3ukO9zhEwYf1EbB9EoaWGQjoQEmYewR1XUABYKAYm90z0kJTt
	 /L2iylCJ91jdcOQSpXmcMCBQLyEXqCCGARSxMtS4XqVWvMsdoo1kNkDUj77Kz5cw9T
	 nNH7dH+zG4pAA==
Date: Thu, 3 Jul 2025 12:45:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] misra: deviate violations of Rule 21.6
In-Reply-To: <e299faef83b0d76c92071002b2302a67fb670b45.1751395929.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507031244190.605088@ubuntu-linux-20-04-desktop>
References: <e299faef83b0d76c92071002b2302a67fb670b45.1751395929.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Jul 2025, Dmytro Prokopchuk1 wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Rule 21.6 states that "The Standard Library input/output
> functions shall not be used".
> 
> Xen does not use the functions provided by the Standard Library,
> uses -nostdlib to ensure this.
> Xen implements a set of functions that share the same names as their
> Standard Library equivalent. The implementation of these functions is
> available in source form: if some undefined or unspecified behavior
> does arise in the implementation, it falls under the jurisdiction of
> other MISRA guidelines.
> 
> Update ECLAIR configuration to deviate violations of the rule,
> tag it as clean and add it to the monitored set.
> 
> Updated docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> The latest Eclair analysis shows 20 violations (ARM64 and X86_64) of the rule MC3A2.R21.6.
> In details:
> 14 violations - use of function `snprintf(char*, size_t, const char*, ...)' (<stdio.h>)
> 6  violations - use of function `vsnprintf(char*, size_t, const char*, va_list)' (<stdio.h>)
> As mentioned before Xen doen't use Standard Library input/output functions.
> It implements its own functions in the common/vsprintf.c.
> So this Rule can be deviated.
> 
>  automation/eclair_analysis/ECLAIR/deviations.ecl |  3 ++-
>  automation/eclair_analysis/ECLAIR/monitored.ecl  |  1 +
>  automation/eclair_analysis/ECLAIR/tagging.ecl    |  1 +
>  docs/misra/deviations.rst                        | 11 ++++++++++-
>  4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9c67358d46..3a4d9ee3c0 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -650,7 +650,8 @@ implements a set of functions that share the same names as their Standard Librar
>  The implementation of these functions is available in source form, so the undefined, unspecified
>  or implementation-defined behaviors contemplated by the C Standard do not apply.
>  If some undefined or unspecified behavior does arise in the implementation, it
> -falls under the jurisdiction of other MISRA rules."
> +falls under the jurisdiction of other MISRA guidelines."
> +-config=MC3A2.R21.6,reports+={deliberate, "any()"}
>  -config=MC3A2.R21.9,reports+={deliberate, "any()"}
>  -config=MC3A2.R21.10,reports+={deliberate, "any()"}
>  -doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index ca2f5e3c7f..e2ad224d79 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -82,6 +82,7 @@
>  -enable=MC3A2.R20.14
>  -enable=MC3A2.R21.3
>  -enable=MC3A2.R21.4
> +-enable=MC3A2.R21.6
>  -enable=MC3A2.R21.5
>  -enable=MC3A2.R21.7
>  -enable=MC3A2.R21.8
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index f9da5d5f4d..5bf214f480 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -93,6 +93,7 @@ MC3A2.R20.14||
>  MC3A2.R21.3||
>  MC3A2.R21.4||
>  MC3A2.R21.5||
> +MC3A2.R21.6||
>  MC3A2.R21.7||
>  MC3A2.R21.8||
>  MC3A2.R21.9||
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index fe0b1e10a2..6cd8f48c91 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -587,7 +587,16 @@ Deviations related to MISRA C:2012 Rules:
>         construct is deviated only in Translation Units that present a violation
>         of the Rule due to uses of this macro.
>       - Tagged as `deliberate` for ECLAIR.
> -     
> +
> +   * - R21.6
> +     - Xen does not use the input/output functions provided by the C
> +       Standard Library, but provides in source form its own implementation,
> +       therefore any unspecified or undefined behavior associated to the
> +       functions provided by the Standard Library does not apply. Any such
> +       behavior that may exist in such functions is therefore under the
> +       jurisdiction of other MISRA C guidelines.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R21.9
>       - Xen does not use the `bsearch` and `qsort` functions provided by the C
>         Standard Library, but provides in source form its own implementation,
> -- 
> 2.43.0
> 

