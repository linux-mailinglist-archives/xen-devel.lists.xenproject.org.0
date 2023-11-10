Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D8B7E86AE
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 00:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630835.983980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1bFm-0002Cs-EA; Fri, 10 Nov 2023 23:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630835.983980; Fri, 10 Nov 2023 23:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1bFm-0002Ao-BU; Fri, 10 Nov 2023 23:49:34 +0000
Received: by outflank-mailman (input) for mailman id 630835;
 Fri, 10 Nov 2023 23:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1bFk-0002Ai-LX
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 23:49:32 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9d940ea-8023-11ee-98da-6d05b1d4d9a1;
 Sat, 11 Nov 2023 00:49:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B4EF0CE16DE;
 Fri, 10 Nov 2023 23:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4834C433C8;
 Fri, 10 Nov 2023 23:49:26 +0000 (UTC)
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
X-Inumbo-ID: c9d940ea-8023-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699660168;
	bh=1All/a8Lap0XJa/MPRanfnfkzMC2g9BumuEPwua10yI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aqbMPzmR9+bFqR6yyuBINjDxhqRLIe1CU5w3bLZ7TCqU7E75OtOpmdG+VR5qlZhhx
	 nD43g3hhbnwxEon0Jz2JRV/tbXRUNRgKh4fCMbQdanYAsru5WvHklUx1HyCXK/dRE6
	 AShNanYat9h7kG6PVZ7SLiJjq1kgCB+916ZSp0T2SMkpIIyMupdaYj1NQPZjgYMfxG
	 2At/lLppnlNJeVAmzQqQwuFha5uDZ5c4h5TH4Zm1to4nNFv8mBUPy9I9EkWvUMuUo3
	 dnewmVdBDquZkKMNfpKTJ/sOIchMVOqKk23g9WJ1Z12dsOP+Urug4M+d1D/6p2NBJ8
	 lWCtG5wDEtoKg==
Date: Fri, 10 Nov 2023 15:49:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
In-Reply-To: <0a168232-ea32-4aa1-b270-961782fec9dc@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311101546100.3478774@ubuntu-linux-20-04-desktop>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com> <20231108152727.58764-4-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2311091601420.3478774@ubuntu-linux-20-04-desktop> <0a168232-ea32-4aa1-b270-961782fec9dc@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-259878124-1699660059=:3478774"
Content-ID: <alpine.DEB.2.22.394.2311101547580.3478774@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-259878124-1699660059=:3478774
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311101547581.3478774@ubuntu-linux-20-04-desktop>

On Fri, 10 Nov 2023, Andrew Cooper wrote:
> On 10/11/2023 12:07 am, Stefano Stabellini wrote:
> > On Wed, 8 Nov 2023, Andrew Cooper wrote:
> >> diff --git a/docs/index.rst b/docs/index.rst
> >> index f3f779f89ce5..22fdde80590c 100644
> >> --- a/docs/index.rst
> >> +++ b/docs/index.rst
> >> @@ -53,17 +53,18 @@ kind of development environment.
> >>     hypervisor-guide/index
> >>  
> >>  
> >> -MISRA C coding guidelines
> >> --------------------------
> >> +Unsorted documents
> >> +------------------
> >>  
> >> -MISRA C rules and directive to be used as coding guidelines when writing
> >> -Xen hypervisor code.
> >> +Documents in need of some rearranging.
> > I understand the need for an "Unsorted documents", but why taking away
> > "MISRA C coding guidelines" from here?
> 
> You can't have it both here and in index.rst without breaking the indexing.
> 
> Also because in it's current position it breaks the navbar.  MISRA is
> part of the developer guide, and what should be at the toplevel should
> be a general section on safety certification, which cross-references the
> developer guide amongst other things.  Nevertheless it will stay visible
> for now at the top level because of how the toctree.
> 
> It's in unsorted because I have thrown the index together with the bare
> minimum effort in order to fix Sphinx errors in time for 4.18.
> 
> This is also why I'm not changing any text.  There is 0 time between now
> and this needing fixing for the release.
> 
> Someone else can find some time to polish it - which is far more work
> than just in the index - and we can backport it when its done.

OK. I don't mean to make things difficult so if you don't think it is
easy to keep "MISRA C coding guidelines" here in docs/index.rst then so
be it. Can you at least add "and related files" to the text in
docs/misra/index.rst? Can be done on commit. Anyway:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-259878124-1699660059=:3478774--

