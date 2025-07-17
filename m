Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579CFB08214
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 03:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046018.1416268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucD7n-0001X7-9u; Thu, 17 Jul 2025 01:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046018.1416268; Thu, 17 Jul 2025 01:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucD7n-0001Uc-77; Thu, 17 Jul 2025 01:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1046018;
 Thu, 17 Jul 2025 01:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucD7m-0001SK-33
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 01:09:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acef79bf-62aa-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 03:09:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E680D5C5625;
 Thu, 17 Jul 2025 01:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D4AC4CEE7;
 Thu, 17 Jul 2025 01:09:21 +0000 (UTC)
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
X-Inumbo-ID: acef79bf-62aa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752714562;
	bh=idBnizPe4gPRsv3QS4RpOUGx1FQkW8OkWYc5UOX4lus=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UBewLE7fzk1ajxI57GVvEDhELw0pYSMn9dwoTfZx8IYDHOkNeiyILILY2Xu8DYu3+
	 YsByi8YulsUuqcvL8j0YHAYDMUEWCHOJNgcP7E6Ujfr+sATG8JnnVwPdthTOM1ZmB7
	 wfPbU9TdZmR496eNViFw8u5ZKnAfkFeTk2UbDBdkqC8ViEpxlzzgxm+0Mb/+I56VPy
	 Qn3lrcaQ12wEfrFoY2jrYrFElGthczUhv8ciyAgzdojWYXtV95LsWy9vqFLiBLUX9p
	 o1vOccdMW69KckDOIaHVpqixPMR5jO91E6qVl5zWPVmOoWUrSU8IO72V572aD3R52X
	 CMZXSzNr6QYaQ==
Date: Wed, 16 Jul 2025 18:09:19 -0700 (PDT)
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
Subject: Re: [PATCH] misra: tailor the definition of Rule 12.2 to C standard
 types
In-Reply-To: <f486aa4ac823085afb7e068f6e84ea6be3cab19b.1752667611.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507161809120.15546@ubuntu-linux-20-04-desktop>
References: <f486aa4ac823085afb7e068f6e84ea6be3cab19b.1752667611.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Dmytro Prokopchuk1 wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> The definition of MISRA C Rule 12.2 ("The right hand operand of a shift
> operator shall lie in the range zero to one less than the width in bits
> of the essential type of the left hand operand") is concerned with the
> essential type of an expression, while the C Undefined Behaviour is
> related to C standard types, which may be wider but not narrower than
> the MISRA C essential type. For this reason, it is safe to consider the
> C standard type, rather than the essential type when checking the rule.
> 
> To avoid regressions, tag the rule as clean and add it to the
> monitored set.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  automation/eclair_analysis/ECLAIR/monitored.ecl  | 1 +
>  automation/eclair_analysis/ECLAIR/tagging.ecl    | 1 +
>  docs/misra/deviations.rst                        | 8 ++++++++
>  4 files changed, 18 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 8504e850c1..483507e7b9 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -413,6 +413,14 @@ write or not"
>  }
>  -doc_end
>  
> +#
> +# Series 12
> +#
> +
> +-doc_begin="Consider the C standard type instead of the essential type for the purposes of determining the width in bits of the operand."
> +-config=MC3A2.R12.2,out_of_bounds=negative_or_too_big_for_type
> +-doc_end
> +
>  #
>  # Series 13
>  #
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index e2ad224d79..00bff9edbe 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -48,6 +48,7 @@
>  -enable=MC3A2.R11.7
>  -enable=MC3A2.R11.8
>  -enable=MC3A2.R11.9
> +-enable=MC3A2.R12.2
>  -enable=MC3A2.R12.5
>  -enable=MC3A2.R13.1
>  -enable=MC3A2.R13.2
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index f39beced9b..879485b680 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -63,6 +63,7 @@ MC3A2.R11.2||
>  MC3A2.R11.6||
>  MC3A2.R11.7||
>  MC3A2.R11.9||
> +MC3A2.R12.2||
>  MC3A2.R12.5||
>  MC3A2.R13.2||
>  MC3A2.R13.6||
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 620e97f0bd..e78179fcb8 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -386,6 +386,14 @@ Deviations related to MISRA C:2012 Rules:
>         integers for this purpose is allowed.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R12.2
> +     - The width in bits of the C standard type is considered instead of
> +       the width of the essential type of the left-hand operand of a shift
> +       operator. This is safe because the occurrence of Undefined Behavior
> +       only relates to the width of the C standard type, which is possibly
> +       wider than its essential type.
> +     - Project-wide deviation.
> +
>     * - R13.5
>       - All developers and reviewers can be safely assumed to be well aware of
>         the short-circuit evaluation strategy for logical operators.
> -- 
> 2.43.0
> 

