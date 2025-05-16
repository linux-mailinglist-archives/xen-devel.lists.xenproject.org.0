Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD30ABA5FA
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 00:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987609.1372802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3gG-0003DJ-NT; Fri, 16 May 2025 22:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987609.1372802; Fri, 16 May 2025 22:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG3gG-0003BC-KK; Fri, 16 May 2025 22:37:28 +0000
Received: by outflank-mailman (input) for mailman id 987609;
 Fri, 16 May 2025 22:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/C0=YA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uG3gF-0003B6-Ed
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 22:37:27 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56e45793-32a6-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 00:37:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CE0BCA4E207;
 Fri, 16 May 2025 22:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0F5C4CEE4;
 Fri, 16 May 2025 22:37:23 +0000 (UTC)
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
X-Inumbo-ID: 56e45793-32a6-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747435044;
	bh=zbv27sExf0fG9TZJkq1zDxcVhW4CrOgBYmYj+U8BPkc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=da+GnuO7IhBBnSxgmv7s6ZeL/XI0zjcGycNd/6Gb5nBudsGnWh0Onc4iwfI03ui6w
	 5CXRx86bI4sS4BE2CsQunbWN7GedVpZJ7hLOzFGB+Mb2PQfgEP7xYs1XkR1ABut8tY
	 YH60aHXM0b6DsCZIQxrry9XFrAiZbc8keCZ4x1HXjCg3q6OpiBXO1nFcIylmRp6+20
	 lqlt5v04YVaAIM9A0wZ6STY+oXoEH1w15ho6G5i6INdFZJ0Tjwh6qHhs/rv2i2V/Ag
	 YKUSZPhZZr5vCkD8U2YVd14N7B33iySY+28mod64usTmo38z+c2VYTRKVa+P2IErcR
	 6J0dtR23y6PkQ==
Date: Fri, 16 May 2025 15:37:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CODING_STYLE: Updated header guard recommendations
In-Reply-To: <20250516142031.58693-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505161537100.145034@ubuntu-linux-20-04-desktop>
References: <20250516142031.58693-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-313421745-1747435043=:145034"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-313421745-1747435043=:145034
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 16 May 2025, Andrew Cooper wrote:
> Despite the best intentions at the time, the current recommendation
> lead to very long identifiers, bordering on the max limit we've chosen
> for certification.
> 
> One observation is that we do have static analysis which will
> highlight if duplicate guards are created accidentally.
> 
> Therefore, relax the recommendations and in particular remove the
> specific tie to the directory structure.  This has the other advantage
> of being more similar to other projects.
> 
> This will hopefully mean there's less churn getting the tree in shape,
> and a random contributor is more likely to pick an appropriate guard
> given no specific knowledge of Xen.
> 
> As always, it's something reviewers and maintainers should be aware
> of, and to advise on.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  CODING_STYLE | 49 ++++++++++++++++++-------------------------------
>  1 file changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index e3b1da604802..5644f1697fc7 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -157,43 +157,30 @@ Header inclusion guards
>  -----------------------
>  
>  Unless otherwise specified, all header files should include proper
> -guards to prevent multiple inclusions. The following naming conventions
> -apply:
> -
> -- Guard names are derived from directory path underneath xen/ and the
> -  actual file name.  Path components are separated by double
> -  underscores.  Alphabetic characters are converted to upper case.  Non-
> -  alphanumeric characters are replaced by single underscores.
> -- Certain directory components are omitted, to keep identifier length
> -  bounded:
> -  - the top level include/,
> -  - architecture-specific private files' arch/,
> -  - any architecture's arch/<arch>/include/asm/ collapses to
> -    ASM__<ARCH>__.
> +guards to prevent multiple inclusions.  Guards need to be unique, and
> +this property is checked by static analysis.
>  
> -For example:
> +Guards should be chosen based on the logical area, with enough
> +disambiguation when the same filename exits in multiple locations in
> +the source tree.  Commonly there should be a XEN or <arch> prefix.
> +The guard should be spelt in ALL CAPITALS, ending with _H.
>  
> -- Xen headers: XEN__<filename>_H
> -  - include/xen/something.h -> XEN__SOMETHING_H
> +For example:
>  
> -- asm-generic headers: ASM_GENERIC__<filename>_H
> -  - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> +- Xen headers: XEN_<something>_H
> +  - include/xen/something.h -> XEN_SOMETHING_H
>  
> -- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
> -  - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> +- arch-specific headers: <arch>_<something>_H
> +  - arch/x86/include/asm/something.h -> X86_SOMETHING_H
> +  - arch/x86/include/asm/hvm/something.h -> X86_HVM_SOMETHING_H
> +  - arch/x86/include/asm/pv/something.h -> X86_PV_SOMETHING_H
>  
> -- Private headers: <dir>__<filename>_H
> -  - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> -  - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> -  - common/something.h -> COMMON__SOMETHING_H
> +- Private headers: <something>_PRIVATE_H
> +  - common/something/private.h -> <SOMETHING>_PRIVATE_H
> +  - drivers/foo/something.h -> <SOMETHING>_H
>  
> -Note that this requires some discipline on the naming of future new
> -sub-directories: There shouldn't be any other asm/ one anywhere, for
> -example.  Nor should any new ports be named the same as top-level
> -(within xen/) directories.  Which may in turn require some care if any
> -new top-level directories were to be added.  Rule of thumb: Whenever
> -adding a new subdirectory, check the rules to prevent any potential
> -collisions.
> +A good choice of guard is one that wont become stale if the
> +driver/subsystem/etc is shuffled around the source tree.
>  
>  Emacs local variables
>  ---------------------
> -- 
> 2.34.1
> 
--8323329-313421745-1747435043=:145034--

