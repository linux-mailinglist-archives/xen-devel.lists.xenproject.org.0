Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A648A219A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 00:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704232.1100487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv2b7-0003Bh-VF; Thu, 11 Apr 2024 22:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704232.1100487; Thu, 11 Apr 2024 22:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv2b7-00039E-SQ; Thu, 11 Apr 2024 22:08:45 +0000
Received: by outflank-mailman (input) for mailman id 704232;
 Thu, 11 Apr 2024 22:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKzY=LQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rv2b6-000396-Dr
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 22:08:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e016e59-f850-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 00:08:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B45556217F;
 Thu, 11 Apr 2024 22:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C59C072AA;
 Thu, 11 Apr 2024 22:08:39 +0000 (UTC)
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
X-Inumbo-ID: 0e016e59-f850-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712873320;
	bh=zs0r5mLtTLlnB5TSmya+qGdZdm/jzRAHvuK78IAkjxk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iYVqiDLwXPDuUCuqrWTsGptcg1VUPuj9G5LOIfWy6tezbK3oWBnLW9uxz/VqG91Ic
	 JFxYBwh3J8KaeB8KRXDwBYBVbvgOFueNqV4WFcQc/SqXPkQjUdwt+/AHpmjbgxqh6+
	 gZcT0g/4MIimHETwe7fKDgxSQ0RrYqFsBAKOEl+PTBJTEORP8XKXMyXZ97nrzyDd/z
	 TQ4icWLoG/jZrSRAw5TyzImw3u2txZXRsmyxCNCtcGkFFOFNr3E6n+/u6sVHKLNzT5
	 qnMCJY5sE55TxC8ScHNwfAlrL8SPaGS6/oIxTyrC1d5KzrDNuB00KK7ZaiYUCkSHao
	 r3LTORPQiV7mA==
Date: Thu, 11 Apr 2024 15:08:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
In-Reply-To: <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop> <20240410234740.994001-1-stefano.stabellini@amd.com> <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1603262779-1712872707=:997881"
Content-ID: <alpine.DEB.2.22.394.2404111501300.997881@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1603262779-1712872707=:997881
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2404111501301.997881@ubuntu-linux-20-04-desktop>

On Wed, 10 Apr 2024, Julien Grall wrote:
> On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini <stefano.stabellini@amd.com> wrote:
>       xen_ulong_t is widely used in public headers.
> 
>       Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>       ---
> 
>       Given that xen_ulong_t is used in public headers there could be a better
>       place for documenting it but this was the most straightforward to add.
>       ---
>        docs/misra/C-language-toolchain.rst | 11 +++++++++++
>        1 file changed, 11 insertions(+)
> 
>       diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
>       index 5ddfe7bdbe..7a334260e6 100644
>       --- a/docs/misra/C-language-toolchain.rst
>       +++ b/docs/misra/C-language-toolchain.rst
>       @@ -531,6 +531,17 @@ A summary table of data types, sizes and alignment is below:
>             - 64 bits
>             - x86_64, ARMv8-A AArch64, RV64, PPC64
> 
>       +   * - xen_ulong_t
>       +     - 32 bits
>       +     - 32 bits
>       +     - x86_32
>       +
>       +   * - xen_ulong_t
>       +     - 64 bits
>       +     - 64 bits
>       +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R
>       +       AArch32, ARMv7-A
> 
> 
> We support neither ARMv8-R nor ARMv8-A Aarch32.
> 
> I could possibly accept the latter because it works to. But the former is so far misleading.

Yes I think you are right. Moreover this document
(C-language-toolchain.rst) is meant for the Xen build. While this patch
is trying to document the types used in the public headers for the
external-facing ABI.

I'll move the information this patch is adding to a separate document,
specific to the public headers. I will only add the architectures
currently working: I'll add ARMv8-A Aarch32 because although it is
unsupported it is interesting to know the size of xen_ulong_t for
aarch32 in the public headers. I will remove ARMv8-R as it is not
available upstream.
--8323329-1603262779-1712872707=:997881--

