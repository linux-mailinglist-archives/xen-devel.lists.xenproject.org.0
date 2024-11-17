Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC139D0483
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2024 16:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838988.1254798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tChK2-0007OW-TJ; Sun, 17 Nov 2024 15:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838988.1254798; Sun, 17 Nov 2024 15:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tChK2-0007Mq-QO; Sun, 17 Nov 2024 15:36:22 +0000
Received: by outflank-mailman (input) for mailman id 838988;
 Sun, 17 Nov 2024 15:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF4L=SM=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1tChK1-0007Mi-OW
 for xen-devel@lists.xenproject.org; Sun, 17 Nov 2024 15:36:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2094af-a4f9-11ef-99a3-01e77a169b0f;
 Sun, 17 Nov 2024 16:36:16 +0100 (CET)
Received: from [192.168.1.219] (unknown [176.206.12.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 643A34EE0754;
 Sun, 17 Nov 2024 16:36:15 +0100 (CET)
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
X-Inumbo-ID: af2094af-a4f9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImFmMjA5NGFmLWE0ZjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxODU3Nzc2Ljc0MDA5LCJzZW5kZXIiOiJyb2JlcnRvLmJhZ25hcmFAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731857775; bh=hOZZSHXf009ZtuzsFIEeXq/xfLhI6HSQhbCZ3ObAnRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dK6fcVPXkx/d54/CQK99X/wTM5TvcbZTrg0GRGQinn7TfKDcLpChAQ8cErJ+8MSTa
	 5lJIRpMwsF1dIWagb4UdXMgek71nTeaBIUVWM4j11JN5X7iNViSdsrbEYqo6XwqtLe
	 B79qQkzqlZsHhO02wjBbE3piANC/GyyLXuJfu9ih/5RCN5EViTJpTsIUURfeBmSIVq
	 xZTv1+uJlHBI66jxKWd6rT+SfZEb4UAytZcC/3VDVvQ4aGoa+QvA5SDtcAXcJ5n5fW
	 hkvEatI4FonluGvsuJTgF7JcwGDXA6andC6evfiUBPZH4G07/ZDTYR7XycL4bJcksJ
	 rvpojaExeXRMw==
Message-ID: <6c8a3461-a412-4cf4-91a0-c799aa90d62c@bugseng.com>
Date: Sun, 17 Nov 2024 16:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: increase identifiers length to 64
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com,
 michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-16 01:23, Stefano Stabellini wrote:
> Currently the identifiers characters limit is arbitrarily set to 40. It
> causes a few violations as we have some identifiers longer than 40.
> 
> Increase the limit to another rather arbitrary limit of 64. Thanks to
> this change, we remove a few violations, getting us one step closer to
> marking Rules 5.2 and 5.4 as clean.
> 
> Also update the ECLAIR config that was actually set to 63 as character
> limit.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> index 86e9a79b52..8fb1778bce 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -155,8 +155,8 @@
>   -doc_end
>   
>   -doc_begin="See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
> --config=STD.extidsig, behavior+={c99, GCC_ARM64, "63"}
> --config=STD.extidsig, behavior+={c99, GCC_X86_64, "63"}
> +-config=STD.extidsig, behavior+={c99, GCC_ARM64, "64"}
> +-config=STD.extidsig, behavior+={c99, GCC_X86_64, "64"}
>   -doc_end
>   
>   #
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 4a144da8d6..3ed5801bff 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -154,7 +154,7 @@ maintainers if you want to suggest a change.
>      * - `Rule 5.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c>`_
>        - Required
>        - External identifiers shall be distinct
> -     - The Xen characters limit for identifiers is 40. Public headers
> +     - The Xen characters limit for identifiers is 64. Public headers
>          (xen/include/public/) are allowed to retain longer identifiers
>          for backward compatibility.
>   
> @@ -162,7 +162,7 @@ maintainers if you want to suggest a change.
>        - Required
>        - Identifiers declared in the same scope and name space shall be
>          distinct
> -     - The Xen characters limit for identifiers is 40. Public headers
> +     - The Xen characters limit for identifiers is 64. Public headers
>          (xen/include/public/) are allowed to retain longer identifiers
>          for backward compatibility.
>   
> @@ -177,7 +177,7 @@ maintainers if you want to suggest a change.
>      * - `Rule 5.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_04.c>`_
>        - Required
>        - Macro identifiers shall be distinct
> -     - The Xen characters limit for macro identifiers is 40. Public
> +     - The Xen characters limit for macro identifiers is 64. Public
>          headers (xen/include/public/) are allowed to retain longer
>          identifiers for backward compatibility.

While for external identifiers 64 can be considered as random as 63,
for internal identifiers and macro names 63, which is what the C99
standard guarantees, is better than 64 (which is one more than the
standard guarantees).

Kind regards,

    Roberto

