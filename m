Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DEA4232BF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 23:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202485.357432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXro6-0005DE-RD; Tue, 05 Oct 2021 21:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202485.357432; Tue, 05 Oct 2021 21:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXro6-0005BT-O1; Tue, 05 Oct 2021 21:17:02 +0000
Received: by outflank-mailman (input) for mailman id 202485;
 Tue, 05 Oct 2021 21:17:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXro4-00058H-Ta
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 21:17:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80c3642e-1d5a-4158-b8bb-72179cc55e30;
 Tue, 05 Oct 2021 21:16:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEE986113A;
 Tue,  5 Oct 2021 21:16:58 +0000 (UTC)
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
X-Inumbo-ID: 80c3642e-1d5a-4158-b8bb-72179cc55e30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633468619;
	bh=vVpUKV/mCzq5BK6WfvsHKEW0ub8Ks9916D0PECYNHw8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EY72OVjaMXVnevUrUORQP09d3F33kHH/mzYoBHJZllQotpvBnkC38yg8mLx+tPaPu
	 mi7tgZdAKt2VIniFd60RNJcgeBzzHA1DXik280sLi1Ob/innAyI+zNI0nwo25SSxWg
	 cefdwYSmpHCzDfq6oxxLiYgGIbj0NP24DdGKv4+zs9mV3AxJUW9CW2UrI82KEMGr78
	 hEcXxAn1x53Gm4XF4C1RwoFZXlqJq9NKoQnptyPyc01hrdlvnMCEoorCzOPVKFssNw
	 3iUFilhv8dQg2wit0R/MGNa7bDHHL9CCV+WmNVm0yl+yhzOhVqkz2ze9h3r2m7wEai
	 otadrvRJkfw1A==
Date: Tue, 5 Oct 2021 14:16:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org, 
    jbeulich@suse.com, julien.grall.oss@gmail.com, 
    dpsmith@apertussolutions.com, andrew.cooper3@citrix.com
Subject: Re: [adhoc test] 165359: tolerable truncated
In-Reply-To: <alpine.DEB.2.21.2110041824350.3209@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2110051416040.3209@sstabellini-ThinkPad-T480s>
References: <E1mXTS5-00046z-9X@osstest.test-lab.xenproject.org> <24923.38127.990669.853370@mariner.uk.xensource.com> <alpine.DEB.2.21.2110041824350.3209@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Oct 2021, Stefano Stabellini wrote:
> On Tue, 5 Oct 2021, Ian Jackson wrote:
> > iwj@xenbits.xen.org writes ("[adhoc test] 165359: tolerable truncated"):
> > > [adhoc play] <testing.git master not a tty>
> > > harness 3a3089c9: mfi-common: Drop Linux dom0 i386 tests for newer Lin...
> > > 165359: tolerable truncated
> > ...
> > > Tests which did not succeed, but are not blocking:
> > >  test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail  like 165218
> > >  test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail  like 165218
> > 
> > This means that the kernel patch fixed the problem.  Nothing went
> > wrong here other than that arm64 doesn't support save/restore and
> > migraiton.
> 
> Fantastic! Let me know if you would like my help updating the Linux
> kernel tree for ARM [1].
> 
> [1] git://xenbits.xen.org/arm/linux.git:linux-arm-xen

FYI linux-arm-xen is now updated with Jan's fixes. Hopefully we'll get a
pass from OSSTest in a few hours.

