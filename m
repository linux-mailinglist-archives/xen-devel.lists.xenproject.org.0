Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B02993830
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812415.1225154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuHV-0002T8-Ll; Mon, 07 Oct 2024 20:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812415.1225154; Mon, 07 Oct 2024 20:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuHV-0002QJ-IR; Mon, 07 Oct 2024 20:24:37 +0000
Received: by outflank-mailman (input) for mailman id 812415;
 Mon, 07 Oct 2024 20:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxuHT-0002QD-S0
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:24:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a16aaef-84ea-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 22:24:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D9BC85C54CC;
 Mon,  7 Oct 2024 20:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98B7C4CEC6;
 Mon,  7 Oct 2024 20:24:31 +0000 (UTC)
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
X-Inumbo-ID: 2a16aaef-84ea-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728332672;
	bh=yIgdFyeI8J6rii4fHmrqh67KlXYe2GZlpB103AnFXmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r4ClFUVy6YP4IlWSdYqUw5SrNdGtWXn632j+L88PKpkYYgM8Wt3as6kTf13VraMQR
	 y+Ua7X5qVVzE+xFyXgrlQACi8e/X/nIL3h29b/3SPsMsGsoKUw4Z7eb6lhV20CMdCq
	 5Bs5crDkLVw2puemsJONsNL4wG6yc6PbthghU7QAAj0GOyvzmiPNmG/F2vc7FGtMoX
	 tMYmxKw+A/B5yCEORjvyRvTDO4Q4nHEECbHtn88Hn0aSVJ/f8RP1ZMXEBZLxAiaSIO
	 FVuxFd4OSeSoExum5324ntdfcBF2f9ha3BB3Yr8komuWeJ0cO/RrG0NbJM9XBr988K
	 ndfGmMOik3cBQ==
Date: Mon, 7 Oct 2024 13:24:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] CI: Drop bin86/dev86 from archlinux container
In-Reply-To: <ZwP3FiXXCmlyxeHF@l14>
Message-ID: <alpine.DEB.2.22.394.2410071323380.1138574@ubuntu-linux-20-04-desktop>
References: <20241007095637.2450599-1-andrew.cooper3@citrix.com> <ZwP3FiXXCmlyxeHF@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-318360012-1728332625=:1138574"
Content-ID: <alpine.DEB.2.22.394.2410071324290.1138574@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-318360012-1728332625=:1138574
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410071324291.1138574@ubuntu-linux-20-04-desktop>

On Mon, 7 Oct 2024, Anthony PERARD wrote:
> On Mon, Oct 07, 2024 at 10:56:37AM +0100, Andrew Cooper wrote:
> > These packages have moved out of main to AUR, and are not easily accessible
> > any more.  Drop them, because they're only needed for RomBIOS which is very
> > legacy these days.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-318360012-1728332625=:1138574--

