Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5662E2129
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 21:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58583.103179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksAT9-0004mv-5X; Wed, 23 Dec 2020 20:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58583.103179; Wed, 23 Dec 2020 20:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksAT9-0004mW-2O; Wed, 23 Dec 2020 20:10:47 +0000
Received: by outflank-mailman (input) for mailman id 58583;
 Wed, 23 Dec 2020 20:10:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ksAT8-0004mR-8J
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 20:10:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09c017ba-c898-4b28-9e60-85d4ce6b0a10;
 Wed, 23 Dec 2020 20:10:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F82620796;
 Wed, 23 Dec 2020 20:10:44 +0000 (UTC)
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
X-Inumbo-ID: 09c017ba-c898-4b28-9e60-85d4ce6b0a10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608754244;
	bh=0nuM4iMLqo8KCJM4BLhb+XCA9hxBZ3+QBP2hMW2MPVU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X7zHt27QBy3B8JToZzFDN6F0Lnfob5bcLbXNEesx/sUVCoiKv4vTx/HW9KAcqRy3e
	 wuHLnQXsJ+pJl8mhpHtDz9NxINc9+N1noNzTaybJxiagn+BPG7aJ/j/T6Gq7Ohyi0v
	 J3XwLf1ZsEyMJeMI3OyUNnbYSpcJ+JYWSTeWqEM8kU5J7N57Ht5SkNj9MpIAiEUYSw
	 PN4xayYr4CK0JE3+Mj2p/Byp0C7i0EBQX/dm6+FYigW4fORHMhLCGaYfjAEKwIFKbP
	 llYIE/7XAgQu9mUha/Nh+1iJmQFJ1pRiQawo6Sb9ksXG2IbSXN9UFumj/E118YaBXI
	 ETSEEdHKJEs/A==
Date: Wed, 23 Dec 2020 12:10:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, famzheng@amazon.com, cardoe@cardoe.com, 
    wl@xen.org, Bertrand.Marquis@arm.com, julien@xen.org
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault
 injection
In-Reply-To: <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
Message-ID: <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
References: <160874604800.15699.17952392608790984041@600e7e483b3a> <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s> <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-245295571-1608754244=:4040"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-245295571-1608754244=:4040
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 23 Dec 2020, Andrew Cooper wrote:
> On 23/12/2020 19:45, Stefano Stabellini wrote:
> > On Wed, 23 Dec 2020, no-reply@patchew.org wrote:
> >> Hi,
> >>
> >> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> >>
> >> You can find the link to the pipeline near the end of the report below:
> >>
> >> Type: series
> >> Message-id: 20201223163442.8840-1-andrew.cooper3@citrix.com
> >> Subject: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
> >>
> >> === TEST SCRIPT BEGIN ===
> >> #!/bin/bash
> >> sleep 10
> >> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> >> === TEST SCRIPT END ===
> > [...]
> >
> >> === OUTPUT BEGIN ===
> >> [2020-12-23 16:38:43] Looking up pipeline...
> >> [2020-12-23 16:38:43] Found pipeline 233889763:
> >>
> >> https://gitlab.com/xen-project/patchew/xen/-/pipelines/233889763
> > This seems to be a genuine failure. Looking at the alpine-3.12-gcc-arm64
> > build test, the build error is appended below. This is a link to the
> > failed job: https://gitlab.com/xen-project/patchew/xen/-/jobs/929842628
> >
> >
> >
> > gcc  -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .xen-diag.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -include /builds/xen-project/patchew/xen/tools/misc/../../tools/config.h -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -D__XEN_TOOLS__ -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -Wno-declaration-after-statement  -c -o xen-diag.o xen-diag.c 
> > xen-fault-ttl.c: In function 'main':
> > xen-fault-ttl.c:25:14: error: 'struct xen_arch_domainconfig' has no member named 'emulation_flags'
> >    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
> >       |              ^~~~~~~~~~~~~~~
> > xen-fault-ttl.c:25:32: error: 'XEN_X86_EMU_LAPIC' undeclared (first use in this function)
> >    25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
> >       |                                ^~~~~~~~~~~~~~~~~
> > xen-fault-ttl.c:25:32: note: each undeclared identifier is reported only once for each function it appears in
> > make[4]: *** [/builds/xen-project/patchew/xen/tools/misc/../../tools/Rules.mk:144: xen-fault-ttl.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> > make[4]: Leaving directory '/builds/xen-project/patchew/xen/tools/misc'
> > make[3]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:160: subdir-install-misc] Error 2
> > make[3]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> > make[2]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:155: subdirs-install] Error 2
> > make[2]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> > make[1]: *** [Makefile:67: install] Error 2
> > make[1]: Leaving directory '/builds/xen-project/patchew/xen/tools'
> > make: *** [Makefile:134: install-tools] Error 2
> 
> Yeah - that is a real failure, which can be fixed with a little bit of
> ifdef-ary.  I'm confused as to why I didn't get that email directly.

It looks like patchew doesn't yet CC the original author?

Also not sure why you weren't part of the default CC group anyway.
--8323329-245295571-1608754244=:4040--

