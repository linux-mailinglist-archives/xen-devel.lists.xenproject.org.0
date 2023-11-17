Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8447EEA91
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 02:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634790.990306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nKN-000348-9B; Fri, 17 Nov 2023 01:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634790.990306; Fri, 17 Nov 2023 01:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nKN-00031U-64; Fri, 17 Nov 2023 01:07:23 +0000
Received: by outflank-mailman (input) for mailman id 634790;
 Fri, 17 Nov 2023 01:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nKM-00031O-GW
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 01:07:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a84a7112-84e5-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 02:07:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B67EBCE20CC;
 Fri, 17 Nov 2023 01:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65158C433C8;
 Fri, 17 Nov 2023 01:07:16 +0000 (UTC)
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
X-Inumbo-ID: a84a7112-84e5-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700183237;
	bh=DFWuj4Kwd3wXAB9lm5dwSz9qqftOpXve/aHuWWF8JT0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ELGWmKfZS5ysmEZxAMFUdwu2ypy6XVbWWtRLsOcP/VGE1Yh4ZUoiTy1+nEgrSrZnq
	 WkLRF8zSfzn5rgY49ymbpyrKqBPlNb+x9gxJLBbt42mHRohaue5IYE0EQDlensYiGw
	 nz7gMohPsJHj/qbnyrv9xc4bqZBTZx61qxhwYn3mrn32cKcDjFYXi2GN4MPK9CYopQ
	 mUMcbaI6A0nKIXDzqw9uyOZs4o7Qx8gBHulpK/5BeVDzSABf84XFrStu8QtTBPdMze
	 CJ84xTo4UyY2K6zJFOLGNp5qUtdeTMavVqfo9YiU+UCkApZSiwsbEwyz1xrOCXUWzi
	 gq30GTjBCYunA==
Date: Thu, 16 Nov 2023 17:07:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/6] automation: remove CR characters from QEMU serial
In-Reply-To: <alpine.DEB.2.22.394.2311161701420.773207@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2311161706310.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-2-roger.pau@citrix.com> <alpine.DEB.2.22.394.2311161701420.773207@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-843817305-1700183237=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-843817305-1700183237=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Nov 2023, Stefano Stabellini wrote:
> On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> > The gitlab CI webpage seems to have issues displaying the \CR\CR\LF "\r\r\n"
> > sequence on the web interface used as line returns by the Linux kernel serial
> > output.  This leads to the QEMU tests output looking like:
> > 
> > (XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
> > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> > (XEN) Freed 664kB init memory
> > mapping kernel into physical memory
> > about to get started...
> > qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)
> > 
> > This not helpful, so strip the CR characters from the output that goes to
> > stdout, leaving the output in the smoke.serial untouched.
> > 
> > Fixes: 3030a73bf849 ('automation: add a QEMU based x86_64 Dom0/DomU test')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks for the patch. Let me see if I understood correctly.
> 
> In the gitlab web UI everything after the last (XEN) log line
> disappears, for instance:
> 
> https://gitlab.com/xen-project/xen/-/jobs/5556551478
> 
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> / # qemu-system-aarch64: terminating on signal 15 from pid 145 (timeout)
> 
> 
> While if I look at the full logs there are plenty of Linux kernel logs
> after it:
> https://cdn.artifacts.gitlab-static.net/ec/ad/ecad5145a0ec1eb179fd47d1590d5ec43d705e8af2f9a816607ac31891cb82b9/2023_11_16/5556551478/6032156805/job.log?response-content-type=text%2Fplain%3B%20charset%3Dutf-8&response-content-disposition=inline&Expires=1700183635&KeyName=gprd-artifacts-cdn&Signature=vT8CBwI2Th23OvRvQKvNPgHiT5Y=
> 
> And this patch aims at fixing that, is that correct?
> 
> 
> But I went to check your pipeline
> https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137
> and the corresponding job
> https://gitlab.com/xen-project/people/royger/xen/-/jobs/5549620441 has
> the same issue?
 
I take it back: you only fixed qemu-alpine-x86_64.sh and not the other.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Can you please add a quick patch to do the same for all the other qemu-*
scripts?
 
 
 
 

> > ---
> >  automation/scripts/qemu-alpine-x86_64.sh | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> > index 8c8d0b0cd759..a1c41c030a47 100755
> > --- a/automation/scripts/qemu-alpine-x86_64.sh
> > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > @@ -84,7 +84,10 @@ qemu-system-x86_64 \
> >      -monitor none -serial stdio \
> >      -nographic \
> >      -device virtio-net-pci,netdev=n0 \
> > -    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
> > +    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
> > +        # Remove carriage returns from the stdout output, as gitlab
> > +        # interface chokes on them
> > +        tee smoke.serial | sed 's/\r//'
> >  
> >  set -e
> >  (grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
> > -- 
> > 2.42.0
> > 
--8323329-843817305-1700183237=:773207--

