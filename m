Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC87BABE3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 23:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613129.953448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoVmf-0003Qo-La; Thu, 05 Oct 2023 21:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613129.953448; Thu, 05 Oct 2023 21:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoVmf-0003NR-Ih; Thu, 05 Oct 2023 21:21:25 +0000
Received: by outflank-mailman (input) for mailman id 613129;
 Thu, 05 Oct 2023 21:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0G7T=FT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoVme-0003N5-IX
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 21:21:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20c28f4d-63c5-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 23:21:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 683C3CE2430;
 Thu,  5 Oct 2023 21:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8255CC433C8;
 Thu,  5 Oct 2023 21:21:16 +0000 (UTC)
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
X-Inumbo-ID: 20c28f4d-63c5-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696540877;
	bh=asJ7eH/UK0mtRY20BN7n4DQL95tN2xa7eo9Qs1vbBGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VzvnhRmi02L4+U5n7oukUjmw9h059JOURPC0fTzKm4+49+rR7fLs/m2yJDepAXgqa
	 uCAiQTDk3J4xo0WktPDT15ARPB03DlGGzILa0as6wUAf3+mSL12qabajotsstBtDg5
	 l/ilW9q/Nhi5oGcZtWPYS+9sWaMKpGndzvGbeQ8dRZplwz0iToB1wvYPt1auTKKwLV
	 X0FkfjTrzTQgEsllHsH0UcU3bjGCJ9tds9bCDaHICdFmwwanKs4tTE8413K21mYWPe
	 BEabHfO+D06pL2SHeL8WrZCdpPGnKdFoNgKwYnnTo61gHNqFJT0id+DsOo59gDBNa2
	 SZlZdP04XZsWw==
Date: Thu, 5 Oct 2023 14:21:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: SAF-x-safe rename
In-Reply-To: <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310051420350.2348112@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop> <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2021320056-1696540877=:2348112"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2021320056-1696540877=:2348112
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Oct 2023, Luca Fancellu wrote:
> > On 5 Oct 2023, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Hi MISRA C working group (Jan, Roger, Andrew, Julien, Bertrand, George)
> > 
> > in a recent thread Andrew pointed out that the SAF-2-safe tag is
> > confusing and requested a rename:
> > https://marc.info/?l=xen-devel&m=169634970821202
> > 
> > As documented by docs/misra/documenting-violations.rst:
> > 
> > - SAF-X-safe: This tag means that the next line of code contains a finding, but
> >   the non compliance to the checker is analysed and demonstrated to be safe.
> > - SAF-X-false-positive-<tool>: This tag means that the next line of code
> >   contains a finding, but the finding is a bug of the tool.
> > 
> > 
> > Today we have already 28 instances of SAF tags in the Xen codebase.
> > 
> > 
> > Andrew suggested "ANALYSIS" instead of SAF so I would imagine:
> > - ANALYSIS-X-safe
> > - ANALYSIS-X-false-positive-<tool>
> > 
> > If we really want a rename I suggest to rename SAF to SAFE:
> > - SAFE-X-safe
> > - SAFE-X-false-positive-<tool>
> > 
> > Or maybe MISRA:
> > - MISRA-X-safe
> > - MISRA-X-false-positive-<tool>
> > 
> > But I actually prefer to keep the tag as it is today.
> 
> We chose a generic name instead of MISRA because the tag can potentially suppress findings
> of any checker, including MISRA checker.
> 
> If SAF-* is confusing, what about FUSA-* ?
> 
> Anyway I’m thinking that every name we could come up will be confusing at first, improving the
> documentation would mitigate it (by improving I mean to improve the fruition of it, for example a
> Read the docs documentation has the search bar, a quick copy paste of SAF- would make the
> documenting-violations page visible.)

I agree, that's why my preference is to keep it as is (and improve the
docs). Even today if you grep for SAF under docs/ you can find what's
what.


> > 
> > If you have any naming suggestions please let me know by Oct 11. After
> > that, I plan to run a Doodle poll to check the preference of the group.

--8323329-2021320056-1696540877=:2348112--

