Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D102B84EA92
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 22:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678484.1055822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC1O-0005us-Ag; Thu, 08 Feb 2024 21:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678484.1055822; Thu, 08 Feb 2024 21:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYC1O-0005t5-7p; Thu, 08 Feb 2024 21:33:26 +0000
Received: by outflank-mailman (input) for mailman id 678484;
 Thu, 08 Feb 2024 21:33:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYC1N-0005sC-CB
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 21:33:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYC1M-0007zj-OJ; Thu, 08 Feb 2024 21:33:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYC1M-0003pD-J3; Thu, 08 Feb 2024 21:33:24 +0000
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
	bh=BW5qiyt7AQfECNgwOhZqLpmZVcPreDUv8vn3ys0CSp4=; b=qkGt7yt+8Ohf49EWTyWEtWfApm
	lDzouXqEQ4pqiIJ+0cDbXWJPAyqT8DiPU6wacmYKFx/Rvxawwk8zXtY1zoFZqB4reUw+o0RDgfiRz
	NhwGUBKBBwUAXL8ja7xIow2afwf+kl5fjfL74wEL+jAE8epMwiaki81LnstTzQ7kQ0JU=;
Message-ID: <ccc568a3-d81c-482c-8768-c5934e3943a8@xen.org>
Date: Thu, 8 Feb 2024 21:33:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to
 exclude-list
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 08/02/2024 07:55, Nicola Vetrini wrote:
> These two files contain several deliberate violations of MISRA C rules and
> they are not linked in the final Xen binary, therefore they can be exempted
> from MISRA compliance.

I am curious, what are the violations you are talking about?

Cheers,

>  > No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Since the exclude list only contains arm64 and x86 files I reasoned that
> introducing an entry that would match all architectures would not be desirable
> (e.g., arm32). I'm happy to change that, though.
> ---
>   docs/misra/exclude-list.json | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 7971d0e70f5b..bd05478e03e9 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -17,6 +17,10 @@
>               "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
>               "comment": "Imported from Linux, ignore for now"
>           },
> +        {
> +          "rel_path": "arch/arm/arm64/asm-offsets.c",
> +          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
> +        },
>           {
>               "rel_path": "arch/x86/acpi/boot.c",
>               "comment": "Imported from Linux, ignore for now"
> @@ -97,6 +101,10 @@
>               "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
>               "comment": "Imported from Linux, ignore for now"
>           },
> +        {
> +          "rel_path": "arch/x86/x86_64/asm-offsets.c",
> +          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
> +        },
>           {
>               "rel_path": "arch/x86/efi/check.c",
>               "comment": "The resulting code is not included in the final Xen binary, ignore for now"

-- 
Julien Grall

