Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E89C13A7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 02:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832233.1247640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9DqE-0003Ce-Cl; Fri, 08 Nov 2024 01:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832233.1247640; Fri, 08 Nov 2024 01:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9DqE-0003A1-9z; Fri, 08 Nov 2024 01:31:14 +0000
Received: by outflank-mailman (input) for mailman id 832233;
 Fri, 08 Nov 2024 01:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHk0=SD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t9DqD-00039v-1c
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 01:31:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e091998-9d71-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 02:31:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 071455C5499;
 Fri,  8 Nov 2024 01:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D53C4CECC;
 Fri,  8 Nov 2024 01:31:01 +0000 (UTC)
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
X-Inumbo-ID: 1e091998-9d71-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjFlMDkxOTk4LTlkNzEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDI5NDY0LjQwMjQ5Nywic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731029462;
	bh=HvPK+7BvsCSRaNi41hp+ycCtCv8SduMHP+Npm4g5BPs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ANuwmyIcVpAXxtrXAaYGsgyApRnB1AjviPTvdF9zdinhSlUrAmb5LPhkKoI6XPYCA
	 k1Ak4D73VMaOlWeJa9gdgAchGxx8VqDpY1O1352xuKMxZIzTNhGsheokYUtrnTHoCK
	 B5E4AmeHDON0yt8CrGWXhwciFDfZESjLS4hSSvpMj91FCBeoLc28yCfdEvUoND6DE7
	 l2baKQu2IRcIqkM4Jl4R2+buIwX5GNjsY+tMzKCFaLTs+RnoLnyq17NBV1FWStxnXN
	 zS8fVImvuJgQtjDfGcHSWbdneYAr9O1kp/kPSBd1VV3ZGxuSJD+cFuVXvm1saxzZEO
	 EqEmVRowwekNw==
Date: Thu, 7 Nov 2024 17:31:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org, 
    Victor Lira <victorm.lira@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [TEST_ARTIFACTS PATCH v1] scripts: add lzo to the x86_64 alpine
 rootfs
In-Reply-To: <0579d685-392a-4707-af8c-49445d8e4000@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411071730520.89051@ubuntu-linux-20-04-desktop>
References: <20241107142012.2593333-1-javi.merino@cloud.com> <0579d685-392a-4707-af8c-49445d8e4000@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Nov 2024, Andrew Cooper wrote:
> On 07/11/2024 2:19 pm, Javi Merino wrote:
> > In the qemu-alpine-x86_64-gcc test, we want to test libxenguest built
> > with all libraries.  If we add lzo-dev to the alpine:3.18 container,
> > libxenguest is linked against it.  However, as the initrd in the
> > test-artifacts does not contain lzo, the qemu-alpine-x86_64-gcc gitlab
> > CI job fails with:
> >
> >   + bash /etc/init.d/xencommons start
> >   Starting /usr/local/sbin/xenstored...
> >   /etc/xen/scripts/launch-xenstore: line 90: echo: write error: Invalid argument
> >   Setting domain 0 name, domid and JSON config...
> >   Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
> >   Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
> >   Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
> >   Starting xenconsoled...
> >   Starting QEMU as disk backend for dom0
> >   + xl list
> >   Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
> >   Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
> >   Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
> >   + xl create -c /root/test.cfg
> >   Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
> >   Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
> >   Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
> >    *   Execution of "/etc/local.d/xen.start" failed.
> >
> > Add lzo to the initrd that becomes the rootfs to install liblzo2.so.2 .
> >
> > Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> Ah - this is a good example of the problem I opined about in
> https://lore.kernel.org/xen-devel/86a60aec-f259-41be-92a0-ce66ce24f4ae@citrix.com/T/#u
> 
> For now, I'll take this and use it as a test of whether I can drive the
> new test-artefacts repo.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

+1

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

