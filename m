Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B93533789
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336895.561332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlc3-0005Z4-PH; Wed, 25 May 2022 07:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336895.561332; Wed, 25 May 2022 07:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntlc3-0005Wa-La; Wed, 25 May 2022 07:39:23 +0000
Received: by outflank-mailman (input) for mailman id 336895;
 Wed, 25 May 2022 07:39:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntlc2-0005WU-MS
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:39:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntlc2-0002Y2-17; Wed, 25 May 2022 07:39:22 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntlc1-0002JF-Rc; Wed, 25 May 2022 07:39:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=oUH2ecaO3iWv8aqf8ra77g7svJJ6cDPr/F5SoO3rEWY=; b=jLshUGYRcrz7Q1WetZgaIHD7Je
	+y9IAhss75DvPWV8AavolMiGokP8Iu7DKOH8A3yaMNwMWRZSKnXJGDG+iFoEJ3E7pKNml+XV7dUxl
	/ZSsljOxUoU4CFsSb+y84BzXrlHtQIGXM4UbqW3gGPagiIWuU/aTKf840qDQQ84CLFIk=;
Message-ID: <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
Date: Wed, 25 May 2022 08:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com,
 Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <20220525003505.304617-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/05/2022 01:35, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Introduce a list of MISRA C rules that apply to the Xen hypervisor. The
> list is in RST format.
> 
> Add a mention of the new list to CODING_STYLE.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

NIT: I was under the impression that the first Signed-off-by is usually 
author. But the From doesn't match.

> ---
>   CODING_STYLE         |  6 ++++
>   docs/misra/rules.rst | 65 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 71 insertions(+)
>   create mode 100644 docs/misra/rules.rst
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 9f50d9cec4..1ef35ee8d0 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -235,3 +235,9 @@ callstack between the initial function call and the failure, no error
>   is returned.  Using domain_crash() requires careful inspection and
>   documentation of the code to make sure all callers at the stack handle
>   a newly-dead domain gracefully.
> +
> +MISRA C
> +-------
> +
> +The Xen Project hypervisor follows the MISRA C coding rules and
> +directives listed under docs/misra/rules.rst.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> new file mode 100644
> index 0000000000..c0ee58ab25
> --- /dev/null
> +++ b/docs/misra/rules.rst
> @@ -0,0 +1,65 @@
> +=====================
> +MISRA C rules for Xen
> +=====================
> +
> +**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
> +MISRA Consortium Limited and used with permission.
> +
> +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
> +licensing options for other use of the rules.
> +
> +The following is the list of MISRA C rules that apply to the Xen Project
> +hypervisor.
I was under the impression that we would still allow deviations on those 
rules in some cases. In particular...

> +
> +- Rule: Dir 2.1
> +  - Severity:  Required
> +  - Summary:  All source files shall compile without any compilation errors
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
> +- Rule: Dir 4.7
> +  - Severity:  Required
> +  - Summary:  If a function returns error information then that error information shall be tested
> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c


... this one. We are using (void) + a comment when the return is ignored 
on purpose. This is technically not-compliant with MISRA but the best we 
can do in some situation.

With your proposed wording, we would technically have to remove them (or 
not introduce new one). So I think we need to document that we are 
allowing deviations so long they are commented.

Cheers,

-- 
Julien Grall

