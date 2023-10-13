Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7E7C9128
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616916.959259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRFh-0007Vu-0x; Fri, 13 Oct 2023 23:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616916.959259; Fri, 13 Oct 2023 23:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRFg-0007Td-US; Fri, 13 Oct 2023 23:07:28 +0000
Received: by outflank-mailman (input) for mailman id 616916;
 Fri, 13 Oct 2023 23:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRFf-0007SL-FU
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:07:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 458f9d25-6a1d-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:07:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7627AB82BD0;
 Fri, 13 Oct 2023 23:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53374C433C7;
 Fri, 13 Oct 2023 23:07:22 +0000 (UTC)
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
X-Inumbo-ID: 458f9d25-6a1d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697238443;
	bh=8PugfQ/uo/8XH2Bfr3Xr9D1/05cFQ+kpfaEm7MS6JMM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=unVLhUbf0xdtqTd1iIpQyYjDGom0ZLbQ2kLJ04dPl3n2oCeBTFvXlG0nbVAUhHPQV
	 70aGpFI4Ncp5H+ugzM+lTtv1jabMn3ibBvtWnvytu+6hN1M65u6XEq7vptRWqNwCyU
	 04F5gMLQaWNq8djOt1s+R0UBYwBLBm3nbQLBBhAP2loz0vrPpmoHXjNU2ApdfM7pJ2
	 F0jy2uEFCYV0ZB8C8tJZ2usd+ND80BJYfkcaUCnyerp5d4I+ahUQEb96Che9ZCmGGx
	 +UrQsemPfiuEXYCCSnJ3hqjDkCSwYsjpYVAna8gp1Hwj4D3gjuPxPjPO+gGeWz5r6B
	 Zlki45FLScaKg==
Date: Fri, 13 Oct 2023 16:07:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
In-Reply-To: <5af543d2-b18b-46c0-87ef-8af99dec81b3@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310131549010.965337@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop> <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com> <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop> <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com> <a93839b8-932a-4634-9549-081df950afb2@xen.org>
 <CA+zSX=a972GC=_FKK2eGkArPb6RszCHDN0+6JKFJiMjoMpAySQ@mail.gmail.com> <f973db5f-da72-4aa2-a35e-1e6652b181bf@xen.org> <CA+zSX=bpq6sJmP7TzC+3vgTJyZcCdZc5M-BGEaOkkXt7BoQZJg@mail.gmail.com> <a1c3de32-7fcb-4c3d-a95b-7aa58c493f52@xen.org>
 <CA+zSX=ad_g5CWkFjs0Cu1=HaTYTLmRpUE8gFVZ+4AJ3meG-0Yw@mail.gmail.com> <5af543d2-b18b-46c0-87ef-8af99dec81b3@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-345707392-1697237498=:965337"
Content-ID: <alpine.DEB.2.22.394.2310131602080.965337@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-345707392-1697237498=:965337
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310131602081.965337@ubuntu-linux-20-04-desktop>

On Fri, 13 Oct 2023, Julien Grall wrote:
> Hi George,
> 
> On 13/10/2023 17:06, George Dunlap wrote:
> > On Fri, Oct 13, 2023 at 4:56 PM Julien Grall <julien@xen.org> wrote:
> > > > The initial patch that
> > > > introduced it didn't mention wanting to include dom0 specifically; on
> > > > the contrary it said:
> > > > 
> > > > "The extra notification is harmless for domains that don't require it."
> > > 
> > > ... even if this is what the commit message says, we can't tell whether
> > > someone would start to rely on it. I definitely see use-cases for it.
> > > 
> > > But I agree that the chance they are actualy used is slim as we didn't
> > > document it.
> > 
> > If a dom0 kernel started relying on the behavior, it would be a bug,
> > since it would be incompatible with releases before 4.16.  So I think
> > the only risk here would be if some bit of a system's userspace
> > tooling relied on it; but I can't really see how that would come to
> > be.
> > 
> > If someone reports a bug, we can always add the reporting back, when
> > we're not under time pressure.
> > 
> > > Your reasoning makes sense. I don't fully agree with it, but at the end
> > > of the day we need to have a solution for dom0less guests... So if the
> > > others agree with you, then I will disagree and commit.
> > > 
> > > That said, I think the commit message should explain why removing dom0
> > > notification is ok.
> > 
> > Yes, absolutely.
> > 
> > Do you or Stefano want to pick it up?  I think you'd be able to test
> > it more thoroughly.  I can build-test it and send it to gitlab-CI, but
> > anything more will take a lot more setup.
> 
> I just asked you a similar question on Matrix. :) Stefano was able to
> reproduce the issue. So it would probably be best for him to pick up at least
> the testing part.
> 
> Stefano, do you have some cycle to send the patch as well? If not, I can do
> it.

I have done the work and the patch works:

https://marc.info/?l=xen-devel&m=169723822001933

However, you should know that I tried to reproduce the original race
condition without the patch, but I couldn't.
--8323329-345707392-1697237498=:965337--

