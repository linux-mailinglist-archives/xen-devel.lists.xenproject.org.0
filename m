Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6F7D063B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 03:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619628.965030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtebu-0004gy-TL; Fri, 20 Oct 2023 01:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619628.965030; Fri, 20 Oct 2023 01:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtebu-0004ej-Ql; Fri, 20 Oct 2023 01:47:34 +0000
Received: by outflank-mailman (input) for mailman id 619628;
 Fri, 20 Oct 2023 01:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnt2=GC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtebt-0004ed-UJ
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 01:47:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2027d2e-6eea-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 03:47:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E7FD2B82E0B;
 Fri, 20 Oct 2023 01:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E2BC433C8;
 Fri, 20 Oct 2023 01:47:29 +0000 (UTC)
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
X-Inumbo-ID: a2027d2e-6eea-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697766449;
	bh=ckDNUVgiCweELcVmuaitrGwswTkGjrwcgUeguKgk9JY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G6JjPqWzyDXVMOUOI+de+x3tk2ONed259h7U+/7E2+krsdmVNTXhLj5xVJupdJ+T4
	 8+5mitrFFHCv/dW6u3uGcyrBTm2ADqmo7655OJVM0s3muCUkiH03oVhFoADP/KWTLx
	 zACunUFCfRmMj+bs/nH2g94tWqms/oEUU9KHiKFbHc3Tv1fwae0yY1xJyQq/Mm2mVY
	 92NeNsGgMrLARvII+vI/6ci9pCOOW9ltP+eNFQK08qfBSdRgkMiIml/PyCVLkEtKRd
	 eGYi0sM3bnov3c377qynNeoS+p9U531lVzEBDgQkoOulJYRCJcxWDuP7UJ7AfkKALO
	 KtZPAIoFZ0bpQ==
Date: Thu, 19 Oct 2023 18:47:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Community Manager <community.manager@xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in
 4.18 dev cycle
In-Reply-To: <B8B61F24-CE9D-4924-992D-A8C43EB22956@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310191847200.2166344@ubuntu-linux-20-04-desktop>
References: <20231019052050.1032492-1-Henry.Wang@arm.com> <20231019052050.1032492-2-Henry.Wang@arm.com> <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop> <B8B61F24-CE9D-4924-992D-A8C43EB22956@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-451017214-1697766449=:2166344"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-451017214-1697766449=:2166344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Oct 2023, Henry Wang wrote:
> Hi Stefano,
> 
> > On Oct 20, 2023, at 00:13, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 19 Oct 2023, Henry Wang wrote:
> >> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> >> ---
> >> CHANGELOG.md | 1 +
> >> 1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/CHANGELOG.md b/CHANGELOG.md
> >> index 165c5caf9b..47e98f036f 100644
> >> --- a/CHANGELOG.md
> >> +++ b/CHANGELOG.md
> >> @@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >>    nodes using a device tree overlay binary (.dtbo).
> >>  - Introduce two new hypercalls to map the vCPU runstate and time areas by
> >>    physical rather than linear/virtual addresses.
> >> + - The project has now officially adopted 72 rules of MISRA-C.
> > 
> > I counted them again, they are 71 today. We have accepted 3 more
> > recently but for the CHANGELOG.md I would stick with what is on
> > docs/misra/rules.rst
> 
> Thanks for the pointer of the doc, I checked the doc and noticed that
> we actually support 65 rules and 6 directives (65+6=71 so you are correct),
> but to avoid the confusion, would you mind me writing in this way:
> "The project has officially adopted 6 directives and 65 rules of MISRA-C”?

Sure that's fine!
--8323329-451017214-1697766449=:2166344--

