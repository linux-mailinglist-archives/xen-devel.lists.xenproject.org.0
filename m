Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790027C7A5D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616185.958005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr52g-0005IP-UT; Thu, 12 Oct 2023 23:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616185.958005; Thu, 12 Oct 2023 23:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr52g-0005EA-R8; Thu, 12 Oct 2023 23:24:34 +0000
Received: by outflank-mailman (input) for mailman id 616185;
 Thu, 12 Oct 2023 23:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr52f-0005E4-In
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:24:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dae1848-6956-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 01:24:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F2AACCE2C87;
 Thu, 12 Oct 2023 23:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359DFC433C8;
 Thu, 12 Oct 2023 23:24:25 +0000 (UTC)
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
X-Inumbo-ID: 7dae1848-6956-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697153067;
	bh=3dHKZfKUznSUzGd2Gwb6iBqM2vdz1+0LGr/8VBp+ylc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tg3UlZTdbGcpmx8TlTGIa1AFJRT9PiuzC6UVeR2yYFD6mscd7i5q2WFTAJM5TKpYK
	 iPOooWO8eloRwDcD+ITcMRTlhKWKpQ9z0AUjippUoIKzSSS7Kky0mfN72IW9IoXKIh
	 Kvt2Nq84wy/485yARlV32vq9wp9v50KWL0wZFRGii3m87Om5PL14cLiHCEVpWtajRh
	 XRTgtE+8b/6Xf3W6ZMxTGiYUmxkTtCHFm5DujBDksq0AjjVBnSdTUBp1mXg9KoBdEA
	 eoG9H91GLNRhunqEAa/xWi8j90y7lHS8LqBQ3Pyed25o4EEe/R/vrmAJ6mzhKERo2p
	 BEzNE1ZmaLcVw==
Date: Thu, 12 Oct 2023 16:24:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
In-Reply-To: <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121622410.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696948320.git.nicola.vetrini@bugseng.com> <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Oct 2023, Nicola Vetrini wrote:
> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> compile-time check to detect non-scalar types; its usage for this
> purpose is deviated.
> 
> Furthermore, the 'access_field' and 'typeof_field' macros are
> introduced as a general way to deal with accesses to structs
> without declaring a struct variable.
> 
> No functional change intended.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - added entry in deviations.rst
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
>  docs/misra/deviations.rst                        | 5 +++++
>  xen/include/xen/compiler.h                       | 5 ++++-
>  xen/include/xen/kernel.h                         | 2 +-
>  4 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fa56e5c00a27..28d9c37bedb2 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -246,6 +246,15 @@ constant expressions are required.\""
>    "any()"}
>  -doc_end
>  
> +#
> +# Series 11
> +#
> +
> +-doc_begin="This construct is used to check if the type is scalar, and for this purpose the use of 0 as a null pointer constant is deliberate."
> +-config=MC3R1.R11.9,reports+={deliberate, "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> +}
> +-doc_end
> +
>  #
>  # Series 13
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index ee7aed0609d2..1b00e4e3e9b7 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.9
> +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
> +       scalar, therefore its usage for this purpose is allowed.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R13.5
>       - All developers and reviewers can be safely assumed to be well aware of
>         the short-circuit evaluation strategy for logical operators.
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index dd99e573083f..15be9a750b23 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -109,13 +109,16 @@
>  
>  #define offsetof(a,b) __builtin_offsetof(a,b)
>  
> +/* Access the field of structure type, without defining a local variable */
> +#define access_field(type, member) (((type *)NULL)->member)
> +#define typeof_field(type, member) typeof(access_field(type, member))
>  /**
>   * sizeof_field(TYPE, MEMBER)
>   *
>   * @TYPE: The structure containing the field of interest
>   * @MEMBER: The field to return the size of
>   */
> -#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
> +#define sizeof_field(TYPE, MEMBER) sizeof(access_field(TYPE, MEMBER))
>  
>  #if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 201112L
>  #define alignof __alignof__
> diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
> index 46b3c9c02625..2c5ed7736c99 100644
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -51,7 +51,7 @@
>   *
>   */
>  #define container_of(ptr, type, member) ({                      \
> -        typeof( ((type *)0)->member ) *__mptr = (ptr);          \
> +        typeof_field(type, member) *__mptr = (ptr);             \
>          (type *)( (char *)__mptr - offsetof(type,member) );})
>  
>  /*
> -- 
> 2.34.1
> 

