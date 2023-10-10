Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D817BF028
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614544.955699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1PR-0008Pz-MC; Tue, 10 Oct 2023 01:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614544.955699; Tue, 10 Oct 2023 01:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1PR-0008OB-JV; Tue, 10 Oct 2023 01:19:41 +0000
Received: by outflank-mailman (input) for mailman id 614544;
 Tue, 10 Oct 2023 01:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq1PP-0008O3-IF
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:19:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1346e2da-670b-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 03:19:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8AE8161418;
 Tue, 10 Oct 2023 01:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5701AC433C7;
 Tue, 10 Oct 2023 01:19:33 +0000 (UTC)
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
X-Inumbo-ID: 1346e2da-670b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696900775;
	bh=rsBzHMI0aQnNqVsXu8qBw73hQNcToEbawrrPoml7xrA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HOBiB0XGF+1h+KWdst6GkuGuXtNkdvV32mntA6m0jLb+QvZclROr6ouqpl89case9
	 kOAJTHGgqS09DzZhRzPjFdZYUcu1134xbUoH79gL8FYm8rRXFc8zyJTUPlE3hNDEp7
	 s/AjgPTGh7DlvMozagGDUTWT4ZLmMM8geqH8hNVddwoOKmfz7+O7K0aLfYWVhxxFaO
	 uj2GlBilAK5ulcxALNWQBSmPAEEyyH3ue6LIHS4wChesp0E3PTa9GVv+n1H0ow/K/M
	 2D6yx5qGIJxkGMCl2Ejz37y4YkLRCkqwrRIp7uSEoZ3qjOX45PIYCH/MGtRIq+UXjP
	 3Yi9Khwmg3AJA==
Date: Mon, 9 Oct 2023 18:19:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry.Wang@arm.com
Subject: Re: [XEN PATCH][for-4.19 v2 2/2] docs/misra: add deviations.rst to
 document additional deviations.
In-Reply-To: <ccda90b6be8f6977cff14ae65749ffc7fa429c3c.1696865051.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091811190.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696865051.git.nicola.vetrini@bugseng.com> <ccda90b6be8f6977cff14ae65749ffc7fa429c3c.1696865051.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Henry

On Mon, 9 Oct 2023, Nicola Vetrini wrote:
> This file contains the deviation that are not marked by
> a deviation comment, as specified in
> docs/misra/documenting-violations.rst.
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

This is great! Thank you so much!

I have a few questions below but even as-is it is way better than
nothing. I think we should add this for 4.18


> ---
>  docs/index.rst            |   1 +
>  docs/misra/deviations.rst | 240 ++++++++++++++++++++++++++++++++++++++
>  docs/misra/rules.rst      |   2 +-
>  3 files changed, 242 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misra/deviations.rst
> 
> diff --git a/docs/index.rst b/docs/index.rst
> index 2c47cfa999f2..f3f779f89ce5 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -63,6 +63,7 @@ Xen hypervisor code.
>     :maxdepth: 2
> 
>     misra/rules
> +   misra/deviations
> 
> 
>  Miscellanea
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> new file mode 100644
> index 000000000000..19743e34ce03
> --- /dev/null
> +++ b/docs/misra/deviations.rst
> @@ -0,0 +1,240 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +MISRA C deviations for Xen
> +==========================
> +
> +The following is the list of MISRA C:2012 deviations for the Xen codebase that
> +are not covered by a `SAF-x-safe` or `SAF-x-false-positive-<tool>` comment, as
> +specified in docs/misra/documenting-violations.rst; the lack of
> +such comments is usually due to the excessive clutter they would bring to the
> +codebase or the impossibility to express such a deviation (e.g., if it's
> +composed of several conditions).
> +
> +Deviations related to MISRA C:2012 Directives:
> +----------------------------------------------
> +
> +.. list-table::
> +   :header-rows: 1
> +
> +   * - Directive identifier
> +     - Justification
> +     - Notes
> +
> +   * - D4.3
> +     - Accepted for the ARM64 codebase
> +     - Tagged as `disapplied` for ECLAIR on any other violation report.

This mean it has been applied for ARM64 but not x86, right?


> +   * - D4.3
> +     - The inline asm in 'xen/arch/arm/arm64/lib/bitops.c' is tightly coupled
> +       with the surronding C code that acts as a wrapper, so it has been decided
> +       not to add an additional encapsulation layer.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +Deviations related to MISRA C:2012 Rules:
> +-----------------------------------------
> +
> +.. list-table::
> +   :header-rows: 1
> +
> +   * - Rule identifier
> +     - Justification
> +     - Notes
> +
> +   * - R2.1
> +     - The compiler implementation guarantees that the unreachable code is
> +       removed. Constant expressions and unreachable branches of if and switch
> +       statements are expected.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R2.1
> +     - Some functions are intended not to be referenced.
> +     - Tagged as `deliberate` for ECLAIR.

What does it mean "some functions" in this case? Should we list which
functions?

Other than this, I checked and everything else looks great


