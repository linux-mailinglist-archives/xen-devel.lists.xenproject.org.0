Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9BD1BB05
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 00:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202382.1517960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfniv-000361-02; Tue, 13 Jan 2026 23:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202382.1517960; Tue, 13 Jan 2026 23:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfniu-000348-T3; Tue, 13 Jan 2026 23:22:52 +0000
Received: by outflank-mailman (input) for mailman id 1202382;
 Tue, 13 Jan 2026 23:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjAJ=7S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfnit-000342-Pd
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 23:22:51 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c64df37c-f0d6-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 00:22:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 196676000A;
 Tue, 13 Jan 2026 23:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330B2C116C6;
 Tue, 13 Jan 2026 23:22:47 +0000 (UTC)
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
X-Inumbo-ID: c64df37c-f0d6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768346567;
	bh=mL/FoDrtK0bhpnitojwJK2Qv3wuQ7upQnsTKciUEp6s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=InjL+/eX0OT/SjG5rDpFGlAnJ/BggceavHGzLj8KImqEBwEvG3t8g/HbGjZMou2eQ
	 6aWAc13KpZeSME49YrIJBqfUMpa35BGEynLm6eLndiDa7/XAMA3Xcb+kvu0VPy8GQr
	 uEOG1t84aGPc6XMS2OTRqAjbBGM9IYCAMVk7aqmRFP4Jps9cutoZJ0lalqlCP5089s
	 QHQQI8wBERwQ2WZeGdYXPT1B7ToVc/iBLnq8z5Y17kuFsDU5Md/gJILfaRjZuUJewQ
	 IsEZbLfNR14PeXf7jsh8h00MsjhBKngTKJ1g/ETzwPoARdI0YR3H/DlZ28dys76v+s
	 5K/fmgspnCrUQ==
Date: Tue, 13 Jan 2026 15:22:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, oleksandr_tyshchenko@epam.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen: introduce xen_console_io option
In-Reply-To: <4f22683f-8fd4-4db6-ac74-83c6f6460924@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601131521590.992863@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601121624450.992863@ubuntu-linux-20-04-desktop> <a42c18c8-9bff-4d85-bb7a-4fbb2c43ad00@suse.com> <4f22683f-8fd4-4db6-ac74-83c6f6460924@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1269708819-1768346568=:992863"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1269708819-1768346568=:992863
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 Jan 2026, Juergen Gross wrote:
> On 13.01.26 08:57, Jürgen Groß wrote:
> > On 13.01.26 01:24, Stefano Stabellini wrote:
> > > Xen can support console_io hypercalls for any domains, not just dom0,
> > > depending on DEBUG and XSM policies. These hypercalls can be very useful
> > > for development and debugging.
> > > 
> > > Introduce a kernel command line option xen_console_io to enable the
> > > usage of console_io hypercalls for any domain upon request. When
> > > xen_console_io is not specified, the current behavior is retained.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Sorry, I need to revoke my R-b.
> 
> I get:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: xen_cons_init+0x0
> (section: .text) -> opt_console_io (section: .init.data)
> 
> I think xen_cons_init() should be __init, too.

Yes you are right, good catch. I am cross-compiling x86 on ARM and my
environment is not warning me about it. I made the change.
--8323329-1269708819-1768346568=:992863--

