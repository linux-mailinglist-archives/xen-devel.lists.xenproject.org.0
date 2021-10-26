Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC143A97A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 02:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216123.375605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfAj9-00018O-65; Tue, 26 Oct 2021 00:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216123.375605; Tue, 26 Oct 2021 00:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfAj9-000151-1S; Tue, 26 Oct 2021 00:54:07 +0000
Received: by outflank-mailman (input) for mailman id 216123;
 Tue, 26 Oct 2021 00:54:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfAj7-00014v-CG
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 00:54:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a829180-a056-46c0-a7bc-88cfcd6c9938;
 Tue, 26 Oct 2021 00:54:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57A0860E05;
 Tue, 26 Oct 2021 00:54:03 +0000 (UTC)
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
X-Inumbo-ID: 0a829180-a056-46c0-a7bc-88cfcd6c9938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635209643;
	bh=HEeMVtfCyJAt2fsNPWRd9oaQjciBifhzo0h6szOps34=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fdSvT32a/MoeOzs96dMdVUvnCOfUM5LtfIPu/Mpbpr1Bp2odig7FIXkCaYNybWN6v
	 Z9LlcWBulifYNEt0e2eiScg1gvmwpnw6NmYCmBQKSpA669Wy7lkyIxCkoCY+s2dZ3w
	 aijaN2e3FKopo07CJke6JFJ2kaQh3CMWM7Iz+HKbb5z6TioSsDqWjTcscPPN/CZoQP
	 W3LRQIfDIBC/nK9tU164ICJGakqoly169y+8G6fcaOz/cd1+nMoCuRuPwdolA7pvLB
	 Jc52nwUHJniHUF2sHg8eaNQIZcPuEHZIB3aXyrj1Zrj09L3I4Arhd3vsGpR+Ka//Fh
	 b0gXo7sMqJOkg==
Date: Mon, 25 Oct 2021 17:54:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    iwj@xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
In-Reply-To: <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
Message-ID: <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-2-sstabellini@kernel.org> <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com> <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1591971946-1635209643=:4586"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1591971946-1635209643=:4586
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 25 Oct 2021, Juergen Gross wrote:
> On 22.10.21 21:41, Stefano Stabellini wrote:
> > +Juergen
> > 
> > On Fri, 22 Oct 2021, Andrew Cooper wrote:
> > > On 22/10/2021 00:08, Stefano Stabellini wrote:
> > > > +# build depends
> > > > +RUN apt-get update && \
> > > > +    apt-get --quiet --yes install \
> > > > +        build-essential \
> > > > +        libssl-dev \
> > > > +        bc \
> > > > +        curl \
> > > > +        flex \
> > > > +        bison \
> > > > +        libelf-dev \
> > > > +        && \
> > > > +    \
> > > > +    # Build the kernel
> > > > +    curl -fsSLO
> > > > https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz
> > > > && \
> > > > +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> > > > +    cd linux-"$LINUX_VERSION" && \
> > > > +    make defconfig && \
> > > > +    make xen.config && \
> > > > +    cp .config .config.orig && \
> > > > +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config
> > > > && \
> > > > +    make -j$(nproc) bzImage && \
> > > 
> > > defconfig is huuuuge.  Can we use tinyconfig instead?
> > > 
> > > Also, you want to turn off CONFIG_MODULES seeing as you only copy
> > > bzImage to the test.
> > > 
> > > This also fixes the fact that `grep XEN` also matches CONFIG_NETXEN_NIC
> > > which has nothing to do with Xen.
> > 
> > Tinyconfig would be a good idea but it crashes on QEMU with the appended
> > boot log. I did:
> > 
> > # make tinyconfig
> > # make xen.config
> > # make bzImage
> > 
> > Of course we could have our own tailored special kernel config for this
> > kernel but I like the simplicify of "make tinyconfig" or "make
> > defconfig" followed by "make xen.config".
> > 
> > Unless you know one kconfig option or two that we need to add to
> > tinyconfig to make it work my preference is to go with defconfig for
> > now.
> 
> You will need to add the dom0 and SMP related config options at least.
> 
> I'll have a look at config.xen, which is a little bit weird: it
> configures the backends, but not dom0.

Thanks, it would be good if make tinyconfig && make xen.config would
just work on QEMU. In the meantime I'll keep defconfig for this test, we
can always improve later.
--8323329-1591971946-1635209643=:4586--

