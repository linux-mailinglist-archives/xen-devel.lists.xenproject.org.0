Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527EB95137
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 10:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128328.1468726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yln-0004py-8n; Tue, 23 Sep 2025 08:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128328.1468726; Tue, 23 Sep 2025 08:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yln-0004nG-5e; Tue, 23 Sep 2025 08:53:07 +0000
Received: by outflank-mailman (input) for mailman id 1128328;
 Tue, 23 Sep 2025 08:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1Uj=4C=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1v0yll-0004n9-Ks
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 08:53:05 +0000
Received: from 19.mo583.mail-out.ovh.net (19.mo583.mail-out.ovh.net
 [46.105.35.78]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b78144f1-985a-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 10:53:04 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.37.252])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4cWDJv4jB6z6VSJ
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 08:53:03 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-q9x2g (unknown [10.110.96.9])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B7DCAC5BA6;
 Tue, 23 Sep 2025 08:53:01 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-5b5ff79f4f-q9x2g with ESMTPSA
 id 9gqAIO1f0mjuYQAAD2cM0A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 23 Sep 2025 08:53:01 +0000
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
X-Inumbo-ID: b78144f1-985a-11f0-9d14-b5c5bf9af7f9
Authentication-Results:garm.ovh; auth=pass (GARM-103G0058440662f-1117-4644-be73-4f94ea993088,
                    4804EDC472500D38916C4D805CCC5D85F75C271A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 23 Sep 2025 11:52:16 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aNJfwP36FPBr78i1@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com>
 <aGqc6HfryKoVoLDL@MjU3Nj>
 <70869cab-ecd1-4756-a874-91fbc9b7ec35@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70869cab-ecd1-4756-a874-91fbc9b7ec35@suse.com>
X-Ovh-Tracer-Id: 6912462481714361433
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF3cPJaf/9hw6Nuh/cAQGE4V1JYeBNdgVI/FVLtRv8IAAr3IUPP98mKOx6sOSpJ88Rt4QXBM11KpFoxIIyWSdZcm79CcP1+2p2GWJ8K6zfY3w4OYO4QSf0EEmG+7JTO/ufFQSWlidzyEJhVbnO5O0qU4/Epx06vTRxPPmQp/AJsFi5l7mYBsuo3wtnwOIVqyhqopZSm4B68ikKIeroS31UYh4/1PWcmgNX2w0u/hM2eQDfR9wLIVfUWTmNPCUhWv+esPsIvosi4Ke36D/xXHA3Zks6SHHncmFALOFYJz/5h9yBfj1CaAKy04LziedOKO+WV8Vu3umMh3L4oKHL4YUP/L2VsZ1aVGefR2058ZeKb1eoa3YO99sPpyO06Ok2wBhU0e8vBHhviUwBscaHA9mFwHO5YXEwzcB9NRubfhH/cc9PkXHAcKwH4GI7xqpyx80eAa+mdA1U5s44qNMCMT6qjarPIS3U5ebJPn4Wd2hMShGGAkqnuj+bnUYAY3g7hleRyP1V61umJ5LgsuzSwx1f7Bo/UoxAs+BlF6Dd7WY3qoK0jMa2yUtjpVxCPT5V9lnFYW5LXDiKoEhAH9yjd0PmnSX9t3F9qUiKfOVwC7AHlPi2omZP2NbQidiJLLQY2zjp1KWBSy+VBddqP55N72xMP4MgFAPN35/VKFy9u4KuvHA
DKIM-Signature: a=rsa-sha256; bh=+auXqZgcWe7xQ7lN3jz0tyMvHEYH8Md1KLPy5CiipSE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1758617583; v=1;
 b=lB87drY7jL9YkmEUbmkXVrPcnYH4yWz3g9wdUMaGRN0C8F9aC47qe4V7JRhyIMnUHAT+Br4v
 CaxFmi7ygbbW1vNvseJiScEqxjMqEHFGDtwTPbHh9zy5eE+U+NALuYmltnwUaBbnVp5iKM7ILPL
 45ztXjxKDEzmZIl3feWkGY4F+qRw73UjiPLSKqh/vZrtXvbn/Duns9NnELyBSMOqrT7WZgdZXzJ
 /iSCW6jizA0QoGtD3afOO8Nsg97NCRL/fPvhyFQOBH/a2+fmRrtX2Cd13b62nr/ef85AWBbH846
 jIzZmlcOsBUermPQmUyAWt+JM3rK4pkjI2J22+lVK8jkQ==

On Mon, Jul 07, 2025 at 10:24:37AM +0200, Jan Beulich wrote:
> On 06.07.2025 17:57, Sergii Dmytruk wrote:
> > On Wed, Jul 02, 2025 at 04:29:18PM +0200, Jan Beulich wrote:
> >> Btw, a brief rev log would be nice here. I saw you have something in the
> >> cover letter, but having to look in two places isn't very helpful.
> >
> > I don't really know how to effectively maintain 23 logs at the same time
> > given that changing one patch has cascading effects on the rest.  I'd
> > suggest using `git diff-range` instead, commands for which I can include
> > in cover letters for convenience.
>
> Well, no, doing this per patch is possible and relevant. For cascading
> effects their mentioning in a revlog can be pretty brief.

OK, will give it a try.

> >>> +    (void)txt_read(TXTCR_ESTS);
> >>
> >> I don't think the cast is needed.
> >
> > It's not needed, but I think that explicitly discarding unused return
> > value is a generally good practice even when there is a comment.
>
> In the context of Misra there has been discussion about doing so. But in our
> present code base you will find such as the exception, not the rule.

Will state the result is discarded in a comment instead.

> >>> +    txt_write(TXTCR_CMD_RESET, 1);
> >>> +    unreachable();
> >>
> >> What guarantees the write to take immediate effect? That is, shouldn't there
> >> be e.g. an infinite loop here, just in case?
> >
> > I'll return infinite loop from v2.  Tried adding `halt()` as Ross
> > suggests, but including <asm/system.h> doesn't work in the early code
> > (something about compat headers and missing expansion of things like
> > __DeFiNe__).
>
> Yeah, untangling that may be a little involved. Open-coding halt() is an
> option, as long as you clearly indicate it as such (for e.g. grep to still
> find that instance).
>
> Jan

Will do that.

Regards

