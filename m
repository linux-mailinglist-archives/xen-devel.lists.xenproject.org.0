Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335E7EFD1E
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635481.991396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4B1Z-00039Q-Vi; Sat, 18 Nov 2023 02:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635481.991396; Sat, 18 Nov 2023 02:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4B1Z-00036f-SN; Sat, 18 Nov 2023 02:25:33 +0000
Received: by outflank-mailman (input) for mailman id 635481;
 Sat, 18 Nov 2023 02:25:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4B1Y-00036Z-OX
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:25:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdd80b3c-85b9-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 03:25:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AEED61DF4;
 Sat, 18 Nov 2023 02:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037CEC433C8;
 Sat, 18 Nov 2023 02:25:26 +0000 (UTC)
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
X-Inumbo-ID: bdd80b3c-85b9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700274327;
	bh=P/pAtM4BpAP0nUNJJRlbFGyazfOJtuOOvA8lKWSt1sM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j0nqGecqpZB4cdGO762nCT5RsT78gq/a8pZu6Br6RectegUG0uDv/xfo4cPc4kp6R
	 73oQopYBRGbe87H8S6aRa8AWs730s8nWKAR00WVtbJ/mpbhPvYPYCsih/4qRZmubzV
	 M57pOM7rwSf7+vjdSaK76MkxpBuGbW43EGJugNgbn5LIKBjaDGICAboRa9w0i9l9sh
	 nG4cuE8w7e5MAiApPFKWNOMXVnTfN0lnA88MEocVVmxrxgVwnbOT2azOsryQfiZqYS
	 j9pi6GwmzDJ7jMes7ORxC1HrUJcvB7aaVJEArIB/x+kQ2hGCGU7wNxQlkxOX8pHyM3
	 cY2oey7Z0JzeQ==
Date: Fri, 17 Nov 2023 18:25:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/6] automation: remove CR characters from QEMU serial
In-Reply-To: <ZVc7a56DXOtEoS0N@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2311171823550.773207@ubuntu-linux-20-04-desktop>
References: <20231116121310.72210-1-roger.pau@citrix.com> <20231116121310.72210-2-roger.pau@citrix.com> <alpine.DEB.2.22.394.2311161701420.773207@ubuntu-linux-20-04-desktop> <ZVc7a56DXOtEoS0N@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-309321110-1700274327=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-309321110-1700274327=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Nov 2023, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 05:05:28PM -0800, Stefano Stabellini wrote:
> > On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> > > The gitlab CI webpage seems to have issues displaying the \CR\CR\LF "\r\r\n"
> > > sequence on the web interface used as line returns by the Linux kernel serial
> > > output.  This leads to the QEMU tests output looking like:
> > > 
> > > (XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
> > > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> > > (XEN) Freed 664kB init memory
> > > mapping kernel into physical memory
> > > about to get started...
> > > qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)
> > > 
> > > This not helpful, so strip the CR characters from the output that goes to
> > > stdout, leaving the output in the smoke.serial untouched.
> > > 
> > > Fixes: 3030a73bf849 ('automation: add a QEMU based x86_64 Dom0/DomU test')
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Thanks for the patch. Let me see if I understood correctly.
> > 
> > In the gitlab web UI everything after the last (XEN) log line
> > disappears, for instance:
> > 
> > https://gitlab.com/xen-project/xen/-/jobs/5556551478
> > 
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> > / # qemu-system-aarch64: terminating on signal 15 from pid 145 (timeout)
> > 
> > 
> > While if I look at the full logs there are plenty of Linux kernel logs
> > after it:
> > https://cdn.artifacts.gitlab-static.net/ec/ad/ecad5145a0ec1eb179fd47d1590d5ec43d705e8af2f9a816607ac31891cb82b9/2023_11_16/5556551478/6032156805/job.log?response-content-type=text%2Fplain%3B%20charset%3Dutf-8&response-content-disposition=inline&Expires=1700183635&KeyName=gprd-artifacts-cdn&Signature=vT8CBwI2Th23OvRvQKvNPgHiT5Y=
> > 
> > And this patch aims at fixing that, is that correct?
> > 
> > 
> > But I went to check your pipeline
> > https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137
> > and the corresponding job
> > https://gitlab.com/xen-project/people/royger/xen/-/jobs/5549620441 has
> > the same issue?
> 
> I made the change just for qemu-alpine-x86_64-gcc:
> 
> https://gitlab.com/xen-project/people/royger/xen/-/jobs/5550049674
> 
> I didn't realize qemu-smoke-dom0-arm64-gcc was also using it.  If the
> fix is acceptable I can submit v2 adding the arm instances also.

Yes the fix is fine. All the qemu scripts are copy/paste design right
now and I am aware they need to be unified. It is not just
qemu-smoke-dom0-arm64-gcc, also qemu-smoke-dom0less-arm64.sh and
basically all the other scripts that start QEMU.
--8323329-309321110-1700274327=:773207--

