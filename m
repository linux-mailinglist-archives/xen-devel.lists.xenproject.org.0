Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7DA083D0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 01:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869178.1280650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2bX-0005Jf-T2; Fri, 10 Jan 2025 00:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869178.1280650; Fri, 10 Jan 2025 00:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2bX-0005I0-PA; Fri, 10 Jan 2025 00:10:23 +0000
Received: by outflank-mailman (input) for mailman id 869178;
 Fri, 10 Jan 2025 00:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tW2bW-0005Hs-6e
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 00:10:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4761351e-cee7-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 01:10:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 693E75C0609;
 Fri, 10 Jan 2025 00:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A88C4CED3;
 Fri, 10 Jan 2025 00:10:18 +0000 (UTC)
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
X-Inumbo-ID: 4761351e-cee7-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736467819;
	bh=YgXK+epiYRolqdYN0qTe36OjpW18LYw84dbcfP19S9E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=puzEKJn6debey9sndXrLunAtEFayzSdYt0SxrXcwuuHxOYrRMIEtevkNzswA9olSY
	 zu/rVcTRsbwKGnGb0p/iA2IYMw5g9HetAK7eXNJGiajmIxt/1KV3+ZJvzVr7TdZumE
	 fS4c97UttIuiAC7gYiShwO9Z+iWfUg085Inbo+5NPJbMXwCIC1yFTyhzyZAAbbUAvk
	 clOnGt0k3EPwDarraA35BGGZyBBfqCTF5cwbbnR+uSN1cgWue0H/sd+FO0E9SqRc7B
	 8jOgHiVREe5sciuaigsCk7FuJ0qM+PlEN87cfLQrISCq3Dt4P3r1UjltWFpIYOdo6R
	 1z6x2W/kUEKbg==
Date: Thu, 9 Jan 2025 16:10:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xen: update pvcalls_front_accept prototype
In-Reply-To: <ec92e932-e3b7-40ad-9ed3-2b3391cc63a7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501091608090.133435@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop> <0f8fc348-14f5-40ac-912a-1785caedb675@suse.com> <alpine.DEB.2.22.394.2501071530180.133435@ubuntu-linux-20-04-desktop> <ec92e932-e3b7-40ad-9ed3-2b3391cc63a7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jan 2025, Jan Beulich wrote:
> On 08.01.2025 00:30, Stefano Stabellini wrote:
> > On Tue, 7 Jan 2025, Jan Beulich wrote:
> >> On 06.01.2025 22:36, Stefano Stabellini wrote:
> >>> xen: update pvcalls_front_accept prototype
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> - also update pvcalls-front.c
> >>
> >> The patch still gives the impression of being incomplete: There's no
> >> caller of the function that you update. However, there's no such caller
> >> in the first place. Why don't you just delete the function then?
> > 
> > It is meant to be called from an out-of-tree module, which has not been
> > upstreamed yet
> 
> And which then would require an EXPORT_SYMBOL() anyway. In Xen, as you're
> well aware, such unreachable code would actually constitute a Misra
> violation.
> 
> Without any in-tree caller, imo the change needs a non-empty description,
> clarifying why the adjustment is wanted / needed.

How about:

---
xen: update pvcalls_front_accept prototype

While currently there are no in-tree callers of these functions, it is
best to keep them up-to-date with the latest network API.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

