Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFA3009E6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 18:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73004.131616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30N4-00004u-VR; Fri, 22 Jan 2021 17:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73004.131616; Fri, 22 Jan 2021 17:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l30N4-0008WB-S7; Fri, 22 Jan 2021 17:37:18 +0000
Received: by outflank-mailman (input) for mailman id 73004;
 Fri, 22 Jan 2021 17:37:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l30N3-0008W6-NU
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 17:37:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l30N3-0004fF-Kg
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 17:37:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l30N3-0002eb-Jz
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 17:37:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l30My-0004Qs-UX; Fri, 22 Jan 2021 17:37:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Z7tMbTglVxu5ykuKvbrAOjDGqFemtyesoQo5K3SwYgE=; b=jouXbVVeMyOHYU2iP6l53AA29i
	iTsRQnRt1sEAx2k1cK0XOz6ea45DbXDxdAwJocAtjZnhP3vr4DdUNIWKTV6jhCU7SawkYNqv0sIyM
	aVZsh/qzYFLyCIn5EXMDNlbgQNwH4WZWq1INYeLgZHXOJr4K3camGCJ6enZ4yvIcdBWw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24587.3400.673049.196349@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 17:37:12 +0000
To: Edwin Torok <edvin.torok@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Christian Lindig <christian.lindig@citrix.com>,
    =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored [and 2 more messages]
In-Reply-To: <a436baeb-888e-a213-2a68-6817309a6b2a@citrix.com>,
	<81f92e66-3a43-dea8-f633-2fcf725c10dc@citrix.com>,
	<8b231075e5ed13412f98881c3b3454d9abf9e871.camel@citrix.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
	<20210122155603.23402-7-iwj@xenproject.org>
	<8b231075e5ed13412f98881c3b3454d9abf9e871.camel@citrix.com>
	<81f92e66-3a43-dea8-f633-2fcf725c10dc@citrix.com>
	<0361ffd5-a640-ac59-c222-4a2d5a9a4727@citrix.com>
	<24586.64456.905401.474099@mariner.uk.xensource.com>
	<a436baeb-888e-a213-2a68-6817309a6b2a@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
> Right, but nothing will actually fail the build.

Indeed.

> So the way this error will manifest is the first non-trivial `xl $FOO`
> executed in dom0 hanging until the job timeout.

I doubt it would produce a timeout BICBW.

> Or does OSSTest have an explicit "is xenstored running" check after
> boot, before any further testing occurs?

No.

If this turns out to ever happen we can improve the pre-checking.  In
general I let the chips fall where they may, for test failures, and
improve the checking/logging later.  Otherwise adding new tests
becomes very time-consuming (and there is also the risk that added
checks do not align with actual behvaiour).

Now that it's builing, I think it's fairly unlikely that we will
accidentally stop building one of the xenstoreds.

> There is no such thing as an ocaml stub-xenstored yet, but I have asked
> the Mirage folk if they'd like to remedy this.

Cool.


Andrew Cooper writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
> An extra thought.  What exactly feeds into the decision?

Precisely, the job name.

> If it includes the flight number, then the retest logic is going to get
> very confused on xenstored bugs when the implementation change between
> the two runs.

Indeed.  But it doesn't :-).

> Also, what is the bisector going across this changeset?

The bisector always runs with the latest osstest.  So if this new C
xenstore testing discovers that it's broken, the bisector won't be
much help.  (It will fail to repro the basis pass; so in any case we
won't get false reports from it.)

On the other hand, if C xenstored still works and some future point we
break it, the bisection will DTRT.


Edwin Torok writes ("Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored"):
> In the patch series that I've recently posted to xen-devel there is
> also a 'make check' target in tools/ocaml/xenstored.

Cool.

Thanks,
Ian.

