Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F633C8BAC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 21:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156192.288219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3kYu-0007eM-O1; Wed, 14 Jul 2021 19:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156192.288219; Wed, 14 Jul 2021 19:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3kYu-0007bF-Jz; Wed, 14 Jul 2021 19:28:52 +0000
Received: by outflank-mailman (input) for mailman id 156192;
 Wed, 14 Jul 2021 19:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3kYt-0007b0-3f
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 19:28:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6ed5708-e4d9-11eb-885e-12813bfff9fa;
 Wed, 14 Jul 2021 19:28:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5BF5613C8;
 Wed, 14 Jul 2021 19:28:48 +0000 (UTC)
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
X-Inumbo-ID: b6ed5708-e4d9-11eb-885e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626290929;
	bh=rPyqVuSVh2irCvBiyOmpbI6hHm6kiNlNLPwuUCdNTVw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HlTWdrVQLBzO51UZkNW7Z28CvLa4FmcIAGGnkQVZAvbGFe90rSdruV1KKCUl1mavr
	 BRqkP5+OA2sNhyNh7IXxr7XjsoQuPNbnQB0AEmI7OFjZm8UTugaLFHy3mWBdZ02HVc
	 q4z5YvG8q+8wfcfxhWBVotuom/pILujvoJ/sqOPeeuVQipkVBMa6vakRjef/kx7p3e
	 aIj9ekyYsmGy/57GkhbhJ+cEIG+33LCjaFtfzFPuyrJcDCROWAiqxteQKTamGob3bD
	 YD/8hR5+BikgGeveT689YDaqQX3E+T7G5TnD22IuhaEjRTp+LVbYYLzm1/sGhI90dG
	 2V70g2JOSwZ7g==
Date: Wed, 14 Jul 2021 12:28:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, iwj@xenproject.org, 
    wl@xen.org
Subject: Re: [PATCH] SUPPORT.md: add Dom0less as Supported
In-Reply-To: <47749630-ff78-e00f-63c0-8ff71a6a04c9@xen.org>
Message-ID: <alpine.DEB.2.21.2107141224550.23286@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107131734170.23286@sstabellini-ThinkPad-T480s> <47749630-ff78-e00f-63c0-8ff71a6a04c9@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 14/07/2021 01:39, Stefano Stabellini wrote:
> > Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> > mature enough and small enough to make it security supported.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index 317392d8f3..c777f3da72 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -832,6 +832,12 @@ OVMF firmware implements the UEFI boot protocol.
> >         Status, qemu-xen: Supported
> >   +## Dom0less
> > +
> > +Guest creation from the hypervisor at boot without Dom0 intervention.
> > +
> > +    Status, ARM: Supported
> > +
> 
> After XSA-372, we will not scrubbed memory assigned to dom0less DomU when
> bootscrub=on.

Do you mean *before* XSA-372, right? I thought the XSA-372 patches take
care of the problem?


> Do we want to exclude this combination or mention that XSAs will
> not be issued if the domU can read secret from unscrubbed memory?

I could say that if bootscrub=off then we won't issue XSAs for domUs reading
secrets from unscrubbed memory. But it is kind of obvious anyway? I am
happy to add it if you think it is good to clarify.

