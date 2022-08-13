Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0D59195C
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 10:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386217.622126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMm8L-0007TU-H3; Sat, 13 Aug 2022 08:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386217.622126; Sat, 13 Aug 2022 08:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMm8L-0007Q8-Dk; Sat, 13 Aug 2022 08:04:37 +0000
Received: by outflank-mailman (input) for mailman id 386217;
 Sat, 13 Aug 2022 08:04:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMm8K-0007Q2-2h
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 08:04:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMm8G-00066i-B5; Sat, 13 Aug 2022 08:04:32 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMm8G-0000Uu-5C; Sat, 13 Aug 2022 08:04:32 +0000
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
	bh=4w0akH7vRku4wkHl73frdEYnb4a+1J6Xsn0B4dwmX3k=; b=5ETNv4pDnQ6gK2rL02AmQrztT6
	zBV4r3hm2glttF9AuOO2+V83VVxJ1YYULDjY+NSq0nhT/4zH1AEvlIZfMeg/ePOKKc+3lVNyclzf8
	mwFbBEFYS6YbWOj7S4O9hztBB5NIqT6omU8D6SuGMyq+ySvzRbaVX8d5LwI0nGbNIG0Q=;
Message-ID: <a604ce43-2b3f-7ac3-36a1-913a66f036d2@xen.org>
Date: Sat, 13 Aug 2022 09:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com
Cc: george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] add SPDX to arch/arm/*.c
In-Reply-To: <alpine.DEB.2.22.394.2208121758520.3790@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/08/2022 01:59, Stefano Stabellini wrote:
> Add SPDX license information to all the *.c files under arch/arm.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> 
> We need to start from somewhere and I thought arch/arm/*.c would be a
> good place to start.

Thanks for doing it. This will make easier to understand the license in 
each file. There are a couple of places below where the SDPX tag is 
incorrect. How did you figure out the which license to use?

Also, I think we should consider to add a section about SPDX in our 
coding style so new files are using it. So we don't end up with a mix in 
arch/arm/*.

> 
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index f03cd943c6..8115f89408 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

Technically, this is a comment. So this should be /* ... */ to follow 
Xen coding style. Also...

>   /*
>    * alternative runtime patching
>    * inspired by the x86 version

... this comment contains information about the license. As you add the 
SPDX, the "long" version should be removed. This would also make easier 
to verify the SPDX you add match existing license.

> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index ec81a45de9..7c986ecb18 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
>    * Early Device Tree
>    *
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index ae649d16ef..887b5426c7 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

This file had no explicit license. I had a look at the 'git log' and 
AFAICT this was either new code and came from Linux. So this looks fine 
to add GPLv2 here.

>   #include <xen/cpu.h>
>   #include <xen/cpumask.h>
>   #include <xen/init.h>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 62d5e1770a..a6253cb57f 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
>    * Contains CPU feature definitions
>    *
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index f5f6562600..f586c3d781 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

This tag doesn't match the license below. It is currently GPLv2+. I 
don't think you can change it without consulting the author. But if it 
is, then it should be mentioned in the commit message.

I remember we discussed in the past that some files were GPLv2+. But I 
can't remember what was the outcome (I can't find the thread). IIRC 
GPLv2+ is a lot more restrictive than GPLv2 and could prevent some 
companies to contribute.

[...]

> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2cd481979c..1a2dac95a9 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0

Same here about GPLv2+. Please go through the rest of the files to 
confirm the license.

Cheers,

-- 
Julien Grall

