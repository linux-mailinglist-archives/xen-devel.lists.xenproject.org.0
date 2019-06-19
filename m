Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212334BF1C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 18:59:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hddsW-0002nC-Pd; Wed, 19 Jun 2019 16:56:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hddsU-0002n7-RB
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 16:56:06 +0000
X-Inumbo-ID: 204c68d6-92b3-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 204c68d6-92b3-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 16:56:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 848EA21537;
 Wed, 19 Jun 2019 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560963364;
 bh=jgyZyEp0fcWKOYdMagFuYunKhp3TJ5dWsFK2MGQi+F8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BA9FEe1At3Fmvn9j+P5W6Sj7y8kdznyKHgNjnbM1yoYeQ1V3Q1IvzL5MnAf6B3eMU
 BMVXr5CE4wTAZGJgdIFd+f0Q/g5NBsf7Gwqt0kGjJcZYrkyuHDpics1zWMeBoJHFvR
 idi9X7wEMPSHPOKnQKdLrq3E2D6km4CPIn+T5hG8=
Date: Wed, 19 Jun 2019 09:56:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <5de0325f-0782-34c5-3118-5ac9a2fafcb9@arm.com>
Message-ID: <alpine.DEB.2.21.1906190943500.2072@sstabellini-ThinkPad-T480s>
References: <2B31D2BD02000066A2327079@prv1-mh.provo.novell.com>
 <5D09E4310200007800239852@prv1-mh.provo.novell.com>
 <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
 <5de0325f-0782-34c5-3118-5ac9a2fafcb9@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1303716807-1560963364=:2072"
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

--8323329-1303716807-1560963364=:2072
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Jun 2019, Julien Grall wrote:
> > On 6/19/19 8:28 AM, Jan Beulich wrote:
> > > > > > On 19.06.19 at 09:06, <osstest-admin@xenproject.org> wrote:
> > > > branch xen-4.10-testing
> > > > xenbranch xen-4.10-testing
> > > > job test-armhf-armhf-xl-arndale
> > > > testid debian-install
> > > > 
> > > > Tree: linux git://xenbits.xen.org/linux-pvops.git
> > > > Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
> > > > Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
> > > > Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> > > > Tree: xen git://xenbits.xen.org/xen.git
> > > > 
> > > > *** Found and reproduced problem changeset ***
> > > > 
> > > >    Bug is in tree:  xen git://xenbits.xen.org/xen.git
> > > >    Bug introduced:  702c9146c00d65d1e9c5955335ba002505e97e09
> > > >    Bug not present: 52220b5f437a8d03ba108e127e7d717657edf99c
> > > >    Last fail repro:
> > > > http://logs.test-lab.xenproject.org/osstest/logs/138005/
> > > > 
> > > > 
> > > >    commit 702c9146c00d65d1e9c5955335ba002505e97e09
> > > >    Author: Julien Grall <julien.grall@arm.com>
> > > >    Date:   Mon Apr 29 15:05:16 2019 +0100
> > > >        xen/arm: Add an isb() before reading CNTPCT_EL0 to prevent
> > > > re-ordering
> > > >        Per D8.2.1 in ARM DDI 0487C.a, "a read to CNTPCT_EL0 can occur
> > > >        speculatively and out of order relative to other instructions
> > > > executed
> > > >        on the same PE."
> > > >        Add an instruction barrier to get accurate number of cycles when
> > > >        requested in get_cycles(). For the other users of CNPCT_EL0,
> > > > replace by
> > > >        a call to get_cycles().
> > > >        This is part of XSA-295.
> > > >        Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > >        Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > > 
> > > Just in case you didn't notice this coming in.
> > 
> > I saw it this morning. But I fail to understand how the instruction barrier
> > will result in a timeout during the guest installation...
> 
> One thing to keep in mind here is isb() will also carry a compiler barrier. So
> the resulting binary may be different as the compiler may re-order the load.
> 
> One possibility is there are a missing data barrier in other part of the code.
> The isb() would expose it.
> 
> > 
> > The more this only doesn't seem to appear on staging-4.12.
> 
> @Stefano, as we know staging-4.12 is working, one way to debug this is to try
> to reproduce in different commit between staging-4.12 with the isb() patch
> applied.
> 
> Hopefully this should test us where the bug was fixed.

Ian, I noticed the bisector hasn't managed to pinpoint a commit on
staging-4.11 yet. Obviously, we suspect it is the same patch ("xen/arm:
Add an isb() before reading CNTPCT_EL0 to prevent re-ordering") causing
the issue, but it would be really good to confirm.

Could you please schedule a bisector run on staging-4.11, ideally on
Arndale hardware (the same used for the bisection on 4.10 here)?


After we confirm that 4.11 is suffering from the same issue, we could
try to identify which commit "fixed" the problem between 4.11 and 4.12,
as 4.12 passed the tests yesterday. I am getting a bit ahead of myself
here, but I would love if we could use the bisector to spot the "fix"
somehow, maybe preparing a special branch for the bisector. The special
branch could start from the common root between staging-4.11 and
staging-4.12, which is tag 4.11.0-rc6, apply the patch that breaks, then
apply the other 4.12 commits, one of them we suspect is the fix we
need:

4.11.0-rc6 | CNTPCT_EL0 patch | other 4.12 commits
 ^               ^
 |               broken patch
 current common root between staging-4.12 and staging-4.11

--8323329-1303716807-1560963364=:2072
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1303716807-1560963364=:2072--

