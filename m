Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4A4D0B91
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 23:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286472.485995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRMJ8-00076D-1Z; Mon, 07 Mar 2022 22:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286472.485995; Mon, 07 Mar 2022 22:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRMJ7-00074N-Uv; Mon, 07 Mar 2022 22:58:25 +0000
Received: by outflank-mailman (input) for mailman id 286472;
 Mon, 07 Mar 2022 22:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqIR=TS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nRMJ6-00074D-Uj
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 22:58:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 167f06ca-9e6a-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 23:58:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0DB9611A9;
 Mon,  7 Mar 2022 22:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C1EC340E9;
 Mon,  7 Mar 2022 22:58:20 +0000 (UTC)
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
X-Inumbo-ID: 167f06ca-9e6a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646693901;
	bh=rUOFJ6HEoRWrFN/T2umu29Kzt0fUu5GhqRNkFJns+54=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lakFENFFm1oyXbGmYuDsLwdoK6FaJ9asxAcx5nqpS+SzyL8UdzX7PsYk8g5gxXfAs
	 acpA+P+xxyK1dYOScCJJ0uYqdnhK5P9ZPMvFzRgde2T5vdc6BNjwcqJzpJ4SWABJKo
	 QBTMoSx4BZNfIzfKyHLGrJpBvIKgYatSXqEyFCbwSdS/fsEaN6WKYTMnatAR6A99ZY
	 jggRdivqP9MRIDrNT+sDgzSWV5eQhvElxFWh7sCb8gpLpwfvLf+DgKujDwX38QXW62
	 iwK5TnvjwfKRvF6A6Baw89kPak5TUesNOhpNeUNqXMkNpww6eMV/3nKs8ULDaEhz+K
	 2NMRLbVKQ90EA==
Date: Mon, 7 Mar 2022 14:58:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
In-Reply-To: <PAXPR08MB7420827063D47932F428CEC89E089@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2203071348220.3261@ubuntu-linux-20-04-desktop>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com> <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org> <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com> <1f0bba54-158b-d171-6f99-0c29e0547f8a@xen.org>
 <PAXPR08MB742067028155B11528C5CCA39E049@PAXPR08MB7420.eurprd08.prod.outlook.com> <PAXPR08MB7420827063D47932F428CEC89E089@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Mar 2022, Wei Chen wrote:
> > > On 01/03/2022 07:51, Wei Chen wrote:
> > > >>> ### 1.2. Xen Challenges with PMSA Virtualization
> > > >>> Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to
> > > run
> > > >>> with an MPU and host multiple guest OSes.
> > > >>>
> > > >>> - No MMU at EL2:
> > > >>>       - No EL2 Stage 1 address translation
> > > >>>           - Xen provides fixed ARM64 virtual memory layout as basis
> > of
> > > >> EL2
> > > >>>             stage 1 address translation, which is not applicable on
> > > MPU
> > > >> system,
> > > >>>             where there is no virtual addressing. As a result, any
> > > >> operation
> > > >>>             involving transition from PA to VA, like ioremap, needs
> > > >> modification
> > > >>>             on MPU system.
> > > >>>       - Xen's run-time addresses are the same as the link time
> > > addresses.
> > > >>>           - Enable PIC (position-independent code) on a real-time
> > > target
> > > >>>             processor probably very rare.
> > > >>
> > > >> Aside the assembly boot code and UEFI stub, Xen already runs at the
> > > same
> > > >> address as it was linked.
> > > >>
> > > >
> > > > But the difference is that, base on MMU, we can use the same link
> > > address
> > > > for all platforms. But on MPU system, we can't do it in the same way.
> > >
> > > I agree that we currently use the same link address for all the
> > > platforms. But this is also a problem when using MMU because EL2 has a
> > > single TTBR.
> > >
> > > At the moment we are switching page-tables with the MMU which is not
> > > safe. Instead we need to turn out the MMU off, switch page-tables and
> > > then turn on the MMU. This means we need to have an identity mapping of
> > > Xen in the page-tables. Assuming Xen is not relocated, the identity
> > > mapping may clash with Xen (or the rest of the virtual address map).
> > >
> > 
> > Is this the same reason we create a dummy reloc section for EFI loader?
> > 
> > > My initial idea was to enable PIC and update the relocation at boot
> > > time. But this is a bit cumbersome to do. So now I am looking to have a
> > > semi-dynamic virtual layout and find some place to relocate part of Xen
> > > to use for CPU bring-up.
> > >
> > > Anyway, my point is we possibly could look at PIC if that could allow
> > > generic Xen image.
> > >
> > 
> > I understand your concern. IMO, PIC is possible to do this, but obviously,
> > it's not a small amount of work. And I want to hear some suggestions from
> > Stefano, because he also has some solutions in previous thread.
> >
> 
> Can you have a look at the PIC discussion between Julien and me?
> I think we may need some inputs from your view.

If we have to have a build-time device tree anyway, we could
automatically generate the link address, together with other required
addresses. There would little benefit to do PIC if we have to have a
build-time device tree in any case.

On the other hand, if we could get rid of the build-time device tree
altogether, then yes doing PIC provides some benefits. It would allow us
to have single Xen binary working on multiple Cortex-R boards. However,
I don't think that would be important from a user perspective. People
will not install Ubuntu on a Cortex-R and apt-get xen.  The target is
embedded: users will know from the start the board they will target, so
it would not be a problem for them to build Xen for a specific board.
ImageBuilder (or something like it) will still be required to generate
boot scripts and boot info. In other words, although it would be
convenient to produce a generic binary, it is not a must-have feature
and I would consider it low-priority compared to others.

