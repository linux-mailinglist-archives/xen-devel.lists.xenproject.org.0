Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F94DDEC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 01:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1he6tX-0003HY-FJ; Thu, 20 Jun 2019 23:55:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1EL/=UT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1he6tV-0003HS-Qt
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 23:55:05 +0000
X-Inumbo-ID: d24af008-93b6-11e9-bef0-2771bee895b3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24af008-93b6-11e9-bef0-2771bee895b3;
 Thu, 20 Jun 2019 23:55:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B848F2084A;
 Thu, 20 Jun 2019 23:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561074903;
 bh=YM7UOIvN9FE6/7uyX6xWZTXu0CDswD8suB9KGwt6PhA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=XhgeBPfmEkJM7D/lyOiuv2v81sU7r6XrQcrY8wm0YmagirY3KrtMjLtUHbTXJmtns
 /e7rZunPzJRB9UrAUJDTmqb5jvmGq/bTKQXVUQy3NxwTuT/M+/Jri41E9biQrS8KDL
 7QbxHgoR/wgYsBd/Y4VB+EiK3vWhOzrIKJwyVBjs=
Date: Thu, 20 Jun 2019 16:55:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <f1dbb360-1946-83c8-128e-caf179b5681d@arm.com>
Message-ID: <alpine.DEB.2.21.1906201645080.2677@sstabellini-ThinkPad-T480s>
References: <2B31D2BD02000066A2327079@prv1-mh.provo.novell.com>
 <5D09E4310200007800239852@prv1-mh.provo.novell.com>
 <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
 <5de0325f-0782-34c5-3118-5ac9a2fafcb9@arm.com>
 <alpine.DEB.2.21.1906190943500.2072@sstabellini-ThinkPad-T480s>
 <f1dbb360-1946-83c8-128e-caf179b5681d@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-537795930-1561074902=:2677"
Subject: Re: [Xen-devel] Fwd: [xen-4.10-testing bisection] complete
 test-armhf-armhf-xl-arndale
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-537795930-1561074902=:2677
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Jun 2019, Julien Grall wrote:
> On 6/19/19 5:56 PM, Stefano Stabellini wrote:
> > On Wed, 19 Jun 2019, Julien Grall wrote:
> > > > On 6/19/19 8:28 AM, Jan Beulich wrote:
> > > > > > > > On 19.06.19 at 09:06, <osstest-admin@xenproject.org> wrote:
> > > > > > branch xen-4.10-testing
> > > > > > xenbranch xen-4.10-testing
> > > > > > job test-armhf-armhf-xl-arndale
> > > > > > testid debian-install
> > > > > > 
> > > > > > Tree: linux git://xenbits.xen.org/linux-pvops.git
> > > > > > Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> > > > > > Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> > > > > > Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> > > > > > Tree: xen git://xenbits.xen.org/xen.git
> > > > > > 
> > > > > > *** Found and reproduced problem changeset ***
> > > > > > 
> > > > > >     Bug is in tree:  xen git://xenbits.xen.org/xen.git
> > > > > >     Bug introduced:  702c9146c00d65d1e9c5955335ba002505e97e09
> > > > > >     Bug not present: 52220b5f437a8d03ba108e127e7d717657edf99c
> > > > > >     Last fail repro:
> > > > > > http://logs.test-lab.xenproject.org/osstest/logs/138005/
> > > > > > 
> > > > > > 
> > > > > >     commit 702c9146c00d65d1e9c5955335ba002505e97e09
> > > > > >     Author: Julien Grall <julien.grall@arm.com>
> > > > > >     Date:   Mon Apr 29 15:05:16 2019 +0100
> > > > > >         xen/arm: Add an isb() before reading CNTPCT_EL0 to prevent
> > > > > > re-ordering
> > > > > >         Per D8.2.1 in ARM DDI 0487C.a, "a read to CNTPCT_EL0 can
> > > > > > occur
> > > > > >         speculatively and out of order relative to other
> > > > > > instructions
> > > > > > executed
> > > > > >         on the same PE."
> > > > > >         Add an instruction barrier to get accurate number of cycles
> > > > > > when
> > > > > >         requested in get_cycles(). For the other users of CNPCT_EL0,
> > > > > > replace by
> > > > > >         a call to get_cycles().
> > > > > >         This is part of XSA-295.
> > > > > >         Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > > >         Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > 
> > > > > Just in case you didn't notice this coming in.
> > > > 
> > > > I saw it this morning. But I fail to understand how the instruction
> > > > barrier
> > > > will result in a timeout during the guest installation...
> > > 
> > > One thing to keep in mind here is isb() will also carry a compiler
> > > barrier. So
> > > the resulting binary may be different as the compiler may re-order the
> > > load.
> > > 
> > > One possibility is there are a missing data barrier in other part of the
> > > code.
> > > The isb() would expose it.
> > > 
> > > > 
> > > > The more this only doesn't seem to appear on staging-4.12.
> > > 
> > > @Stefano, as we know staging-4.12 is working, one way to debug this is to
> > > try
> > > to reproduce in different commit between staging-4.12 with the isb() patch
> > > applied.
> > > 
> > > Hopefully this should test us where the bug was fixed.
> > 
> > Ian, I noticed the bisector hasn't managed to pinpoint a commit on
> > staging-4.11 yet. Obviously, we suspect it is the same patch ("xen/arm:
> > Add an isb() before reading CNTPCT_EL0 to prevent re-ordering") causing
> > the issue, but it would be really good to confirm.
> > 
> > Could you please schedule a bisector run on staging-4.11, ideally on
> > Arndale hardware (the same used for the bisection on 4.10 here)?
> > 
> > 
> > After we confirm that 4.11 is suffering from the same issue, we could
> > try to identify which commit "fixed" the problem between 4.11 and 4.12,
> > as 4.12 passed the tests yesterday. I am getting a bit ahead of myself
> > here, but I would love if we could use the bisector to spot the "fix"
> > somehow, maybe preparing a special branch for the bisector. The special
> > branch could start from the common root between staging-4.11 and
> > staging-4.12, which is tag 4.11.0-rc6, apply the patch that breaks, then
> > apply the other 4.12 commits, one of them we suspect is the fix we
> > need:
> > 
> > 4.11.0-rc6 | CNTPCT_EL0 patch | other 4.12 commits
> >   ^               ^
> >   |               broken patch
> >   current common root between staging-4.12 and staging-4.11
> > 
> 
> Actually I may have found the error. I feel quite ashamed I didn't spot this
> during review and when the bisector fingered it.
> 
> staging-4.11 and staging.4.12 didn't have get_cycles implemented (i.e it
> returned 0). During the backport, get_cycles() got suddenly implemented (aside
> the isb()) so it now returns the number of cycles.
> 
> However, before commit da3d55ae67 "console: avoid printing no or null time
> stamps", cycles_t (return type of get_cycles) was unsigned long. On arm32
> unsigned long is 32-bit and therefore does not cover the full counter
> (64-bit). So the number of cycles will be truncated leading to all sort of
> timing issue.
> 
> The correct fix is to switch cycles_t from unsigned long to uint64_t. I think
> we would need this to be backported for xen 4.9 and 4.8 as well.
> 
> I will send a fix.

Thank you, I am glad it got resolved quicker than expected.


> This is the second instance where backport gone wrong in this XSA. Stefano,
> when you have a clash during backport, can you make sure to investigate the
> problem and also write in the commit message what you changed?

Investigation is not bulletproof, in this case the issue slipped through
several reviews by multiple people. But one thing we can do is to adopt
the Linux common practice of writing the changes during backports and
merges between square brackets, such as:

  [fix blah blah blah]

It would make it a bit easier to spot mistakes.
--8323329-537795930-1561074902=:2677
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-537795930-1561074902=:2677--

