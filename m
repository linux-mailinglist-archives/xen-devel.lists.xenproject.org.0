Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05DA53E50
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 00:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902893.1310827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpy1R-0000gh-3k; Wed, 05 Mar 2025 23:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902893.1310827; Wed, 05 Mar 2025 23:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpy1R-0000eY-0h; Wed, 05 Mar 2025 23:19:29 +0000
Received: by outflank-mailman (input) for mailman id 902893;
 Wed, 05 Mar 2025 23:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gbs/=VY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpy1P-0000eS-P3
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 23:19:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 467367cf-fa18-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 00:19:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D3475C632A;
 Wed,  5 Mar 2025 23:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1552DC4CED1;
 Wed,  5 Mar 2025 23:19:21 +0000 (UTC)
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
X-Inumbo-ID: 467367cf-fa18-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741216763;
	bh=NbYutpG+TXZU1bfu4zLtZvF03xkkr3JC2Cg8Qnje7aQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fGVZgrFfnkKOVzndlxiJA8Rz58mt5SjFe7FYixm7eDVaf8fp06wtfgZABz9iaySpv
	 +TGd4T12jqUgAz/mu4ynpuXjT7KuxkUHMvRt6hyJ9+aE0BAkxmMTbYF5+ShIx2z0VT
	 iELPG2STzfFn7Vvo+gFtgTdrCFtEKWUhPNoNizl4q/+KvUmOhddzsinmX7EU9cwvih
	 ppwNfRgb9a/aQgQBVibzPY075zP5q68jnPTSi2gp+Bi2sYmrQWOBhCdLGYR29HGfn4
	 AmhyNPf44na4Db68ydx2781vHQooz5nFY+tLl4/tWIYiJjxm0yodRNcgBqnwx5gCha
	 YIhRn+RJzd3wg==
Date: Wed, 5 Mar 2025 15:19:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Xen: CI fixes from XSN-2
In-Reply-To: <20250305222343.2874591-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503051519040.1303386@ubuntu-linux-20-04-desktop>
References: <20250305222343.2874591-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-422915014-1741216763=:1303386"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-422915014-1741216763=:1303386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 5 Mar 2025, Andrew Cooper wrote:
>  * Add cf_check annotation to cmp_patch_id() used by bsearch().
>  * Add U suffix to the K[] table to fix MISRA Rule 7.2 violations.
> 
> Fixes: 372af524411f ("xen/lib: Introduce SHA2-256")
> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> TODO: Make a working CI pipline the security team can use.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1701963907
> ---
>  xen/arch/x86/cpu/microcode/amd.c |  2 +-
>  xen/lib/sha2-256.c               | 32 ++++++++++++++++----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index 27caed102818..ee7de5282b2a 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -99,7 +99,7 @@ static const struct patch_digest {
>  #include "amd-patch-digests.c"
>  };
>  
> -static int cmp_patch_id(const void *key, const void *elem)
> +static int cf_check cmp_patch_id(const void *key, const void *elem)
>  {
>      const struct patch_digest *pd = elem;
>      uint32_t patch_id = *(uint32_t *)key;
> diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
> index 4aeb8aa20490..19e8252188f7 100644
> --- a/xen/lib/sha2-256.c
> +++ b/xen/lib/sha2-256.c
> @@ -56,22 +56,22 @@ static uint32_t blend(uint32_t W[16], unsigned int i)
>  }
>  
>  static const uint32_t K[] = {
> -    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
> -    0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
> -    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
> -    0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
> -    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
> -    0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
> -    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
> -    0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
> -    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
> -    0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
> -    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
> -    0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
> -    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
> -    0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
> -    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
> -    0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
> +    0x428a2f98U, 0x71374491U, 0xb5c0fbcfU, 0xe9b5dba5U,
> +    0x3956c25bU, 0x59f111f1U, 0x923f82a4U, 0xab1c5ed5U,
> +    0xd807aa98U, 0x12835b01U, 0x243185beU, 0x550c7dc3U,
> +    0x72be5d74U, 0x80deb1feU, 0x9bdc06a7U, 0xc19bf174U,
> +    0xe49b69c1U, 0xefbe4786U, 0x0fc19dc6U, 0x240ca1ccU,
> +    0x2de92c6fU, 0x4a7484aaU, 0x5cb0a9dcU, 0x76f988daU,
> +    0x983e5152U, 0xa831c66dU, 0xb00327c8U, 0xbf597fc7U,
> +    0xc6e00bf3U, 0xd5a79147U, 0x06ca6351U, 0x14292967U,
> +    0x27b70a85U, 0x2e1b2138U, 0x4d2c6dfcU, 0x53380d13U,
> +    0x650a7354U, 0x766a0abbU, 0x81c2c92eU, 0x92722c85U,
> +    0xa2bfe8a1U, 0xa81a664bU, 0xc24b8b70U, 0xc76c51a3U,
> +    0xd192e819U, 0xd6990624U, 0xf40e3585U, 0x106aa070U,
> +    0x19a4c116U, 0x1e376c08U, 0x2748774cU, 0x34b0bcb5U,
> +    0x391c0cb3U, 0x4ed8aa4aU, 0x5b9cca4fU, 0x682e6ff3U,
> +    0x748f82eeU, 0x78a5636fU, 0x84c87814U, 0x8cc70208U,
> +    0x90befffaU, 0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U,
>  };
>  
>  static void sha2_256_transform(uint32_t *state, const void *_input)
> 
> base-commit: 630e8875ab368b97cc7231aaf3809e3d7d5687e1
> -- 
> 2.39.5
> 
--8323329-422915014-1741216763=:1303386--

