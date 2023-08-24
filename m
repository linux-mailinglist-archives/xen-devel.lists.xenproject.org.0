Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F841786E3D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 13:46:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590014.922108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8nG-0006C9-Gt; Thu, 24 Aug 2023 11:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590014.922108; Thu, 24 Aug 2023 11:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ8nG-0006AU-DH; Thu, 24 Aug 2023 11:46:30 +0000
Received: by outflank-mailman (input) for mailman id 590014;
 Thu, 24 Aug 2023 11:46:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qZ8nE-0006AO-Sm
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 11:46:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ8nE-0003ci-8h; Thu, 24 Aug 2023 11:46:28 +0000
Received: from [15.248.3.1] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qZ8nE-0005lp-1x; Thu, 24 Aug 2023 11:46:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ycKZETRTqkNzSfyQdPAx/QvdCySAxTDZ7ru8pPs0+aQ=; b=T3yboQVsst6h1Ogh5ssQP9e5E9
	HS3GnPkczb91F3pVcGLhEj3Cma4+eram9d6Y0DHYHX+s27AGi6d5surGZwAP3VkPPPAcawat3IZA1
	erOZGjMoA3SIO0ETJkC2Ty9IyrTcp/dbe64dNuSK6lndpw14zb+iZGIOjwg7uQapmDY8=;
Message-ID: <0076d7e6-f099-473b-b81b-9ce8d5e18b7a@xen.org>
Date: Thu, 24 Aug 2023 12:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: add rule 2.1 exceptions
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 nicola.vetrini@bugseng.com, Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230823223942.2981782-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230823223942.2981782-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/08/2023 23:39, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> During the discussions that led to the acceptance of Rule 2.1, we
> decided on a few exceptions that were not properly recorded in
> rules.rst. Add them now.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that safe.json and the codebase are not yet updated with an
> appropriate tag for BUG, panic and friends.

I think it should be updated with at least one of them. Otherwise...

> 
> v2:
> - fix typo in commit message
> - use "only referenced from assembly"
> - use "Deliberate unreachability caused by"
> - add "See safe.json"
> - add acked-by (although I also added "See safe.json")
> ---
>   docs/misra/rules.rst | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 8f0e4d3f25..4f33ed4ba6 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -106,7 +106,18 @@ maintainers if you want to suggest a change.
>      * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
>        - Required
>        - A project shall not contain unreachable code
> -     -
> +     - The following are allowed:
> +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> +         - Switch with a controlling value statically determined not to
> +           match one or more case statements
> +         - Functions that are intended to be referenced only from
> +           assembly code (e.g. 'do_trap_fiq')
> +         - Deliberate unreachability caused by certain macros/functions,
> +           e.g. BUG, assert_failed, panic, etc. See safe.json.

... someone reading this and then reading safe.json will wonder why none 
are present.

The list would then only contain the one(s) currently added in 
safe.json. But there should be no expectation that the examples will 
grow everytime one is added in safe.json.

> +         - asm-offsets.c, as they are not linked deliberately, because
> +           they are used to generate definitions for asm modules
> +         - Declarations without initializer are safe, as they are not
> +           executed
>   
>      * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
>        - Advisory

Cheers,

-- 
Julien Grall

