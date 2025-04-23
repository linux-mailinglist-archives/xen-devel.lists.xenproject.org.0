Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31899A999C4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965363.1355943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h7d-0004mg-SO; Wed, 23 Apr 2025 20:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965363.1355943; Wed, 23 Apr 2025 20:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h7d-0004kP-PI; Wed, 23 Apr 2025 20:55:09 +0000
Received: by outflank-mailman (input) for mailman id 965363;
 Wed, 23 Apr 2025 20:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7h7c-0004kJ-SW
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:55:08 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c224f27-2085-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 22:55:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 85593A4C24B;
 Wed, 23 Apr 2025 20:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8FFC4CEE2;
 Wed, 23 Apr 2025 20:55:02 +0000 (UTC)
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
X-Inumbo-ID: 3c224f27-2085-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745441705;
	bh=sp3WIx0AyO8v30est76NhThGhAxzVhZlGB8nU9Kv1ns=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XZAWy5Ix7yVPquxVMVVDyd+jv/RDdEI7UdmxVhubD1XcRLe5rnkdDKyVXOLPs/9aC
	 9HkEPABka77rzlqoJDhgUP8IxoIyWZMY8OpVIVUeZnbF6fseSskndKVz+yUhiktwxD
	 3ViSVXiBYJ+kdDVuCfnO1oUG9jr0GxJRdJYWtgE6pMTAEEOvDD54HYU2rAy4GRC0MG
	 BXaalpBP8GyaXjN3O0dfnpzXJVDrh4CUGB1VBiDrfAeAummPuUo7n6RFcPNNWeHbzz
	 XDsqGmJuvUQXzZ11ekULg/yOPfWgYLzFPi9hZKnYkVa/a0PmfyPSEce3uXOlMta7SW
	 IWYVMDy1UzW8A==
Date: Wed, 23 Apr 2025 13:55:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] misra: update list of GCC extensions used by Xen
In-Reply-To: <da508095ef2ac0024dfe9f51d9da976da0eaead7.1745441038.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2504231354540.785180@ubuntu-linux-20-04-desktop>
References: <da508095ef2ac0024dfe9f51d9da976da0eaead7.1745441038.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Nicola Vetrini wrote:
> __inline was not mentioned in C-language-toolchain.rst, while
> __inline__ is not used in code under xen/. __inline is kept because it
> may be used in Xen. The ECLAIR configuration is now consistent with the
> documented extensions in the rst file.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> See [1] for a patch that introduces a use of __inline. Rather than
> remove it because there are no current uses of that alternate spelling
> before shortly bringing it back, it makes more sense to keep it in both
> places.
> 
> [1] https://lore.kernel.org/xen-devel/20250422113957.1289290-1-andrew.cooper3@citrix.com/
> ---
>  automation/eclair_analysis/ECLAIR/toolchain.ecl | 5 +++--
>  docs/misra/C-language-toolchain.rst             | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> index 8ebf9f132cf2..b8c041d2d36e 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -18,7 +18,8 @@
>      __builtin_offsetof: see Section \"6.53 Support for offsetof\" of "GCC_MANUAL".
>      __builtin_types_compatible_p: see Section \"6.59 Other Built-in Functions Provided by GCC\" of "GCC_MANUAL".
>      __builtin_va_arg: non-documented GCC extension.
> -    __const__, __inline__, __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
> +    __const__: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
> +    __inline: see Section \"6.48 Alternate Keywords\" of "GCC_MANUAL".
>      _Static_assert: see Section \"2.1 C Language\" of "GCC_MANUAL".
>      typeof, __typeof__: see Section \"6.7 Referring to a Type with typeof\" of "GCC_MANUAL".
>      __volatile__: see Sections \"6.48 Alternate Keywords\" and \"6.47.2.1 Volatile\" of "GCC_MANUAL".
> @@ -30,7 +31,7 @@
>  -name_selector+={builtin_types_p, "^__builtin_types_compatible_p$"}
>  -name_selector+={builtin_va_arg, "^__builtin_va_arg$"}
>  -name_selector+={const, "^__const__$"}
> --name_selector+={inline, "^(__inline__|__inline)$"}
> +-name_selector+={inline, "^__inline$"}
>  -name_selector+={static_assert, "^_Static_assert$"}
>  -name_selector+={typeof, "^(__typeof__|typeof)$"}
>  -name_selector+={volatile, "^__volatile__$"}
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index 5ddfe7bdbe10..5d4db857d198 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -86,6 +86,8 @@ The table columns are as follows:
>            see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
>         __const__:
>            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
> +       __inline:
> +          see Section "6.48 Alternate Keywords" of GCC_MANUAL.
>         typeof, __typeof__:
>            see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
>         __alignof__, __alignof:
> -- 
> 2.43.0
> 

