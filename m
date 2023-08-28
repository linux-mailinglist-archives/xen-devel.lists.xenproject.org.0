Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01378BA7C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 23:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591790.924294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakGL-0003ep-G8; Mon, 28 Aug 2023 21:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591790.924294; Mon, 28 Aug 2023 21:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakGL-0003cW-DR; Mon, 28 Aug 2023 21:59:09 +0000
Received: by outflank-mailman (input) for mailman id 591790;
 Mon, 28 Aug 2023 21:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakGK-0003cQ-Vr
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 21:59:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b276e69-45ee-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 23:59:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CD396156D;
 Mon, 28 Aug 2023 21:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F6FC433C8;
 Mon, 28 Aug 2023 21:59:03 +0000 (UTC)
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
X-Inumbo-ID: 1b276e69-45ee-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693259944;
	bh=t4bkACphMkY6pxw7VlE224cgUQFutJbQJCbyJ0QZnEg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V4w5LSrzOFiDALkY8VjBrP8M50BHbBvLERBNRSS7aQ2iiQ8jJfbB8nnP50reAHGv+
	 nsIVLy4TEFiHoGMfJjjMsY112aIcCiu2QZRUuWVPzMFLZ4KrExPFZjhBAciYpEX4ZO
	 5zuZp1A6yJ39uYEX+BF2OCOjKSrEfjT734YRHy1lj37k3les7mj+7pbE0tS+9cAVXi
	 pvHa2wgN/0ItyzU8m+ZJk6w7VE1UGXzRz7LbpJRF7IIVqI7zNJnjIJZK/LX2HTK4Ul
	 o2kILyjvxGbq685B3xuPh00x9+FVOnAZcjAp5a75TiceNtLQ12s7BqGQwm4AXkMqik
	 AFms6J153odNQ==
Date: Mon, 28 Aug 2023 14:59:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 01/13] misra: add deviation for headers that explicitly
 avoid guards
In-Reply-To: <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281458390.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <9b8165105c28f8e684844f56814726498e34c46e.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Some headers, under specific circumstances (documented in a comment at
> the beginning of the file), explicitly avoid inclusion guards: the caller
> is responsible for including them correctly.
> 
> These files are not supposed to comply with Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of a header
> file being included more than once"
> 
> This patch adds a deviation for all headers that contain the following
> in a comment text:
> "In this case, no inclusion guards apply and the caller is responsible"
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/rules.rst                             | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b4..5f068377fa 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -91,6 +91,10 @@ conform to the directive."
>  -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
>  -doc_end
>  
> +-doc_begin="Some headers, under specific circumstances, explicitly avoid inclusion guards."
> +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
> +-doc_end
> +
>  #
>  # Series 5.
>  #
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index db30632b93..4b1a7b02b6 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -60,7 +60,8 @@ maintainers if you want to suggest a change.
>       - Precautions shall be taken in order to prevent the contents of a
>         header file being included more than once
>       - Files that are intended to be included more than once do not need to
> -       conform to the directive
> +       conform to the directive. Files that explicitly avoid inclusion guards
> +       under specific circumstances do not need to conform the directive.
>  
>     * - `Dir 4.11 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_11.c>`_
>       - Required
> -- 
> 2.34.1
> 

