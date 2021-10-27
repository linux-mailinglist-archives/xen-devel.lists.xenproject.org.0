Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F410043D6E3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 00:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217508.377594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfrex-0001qw-B5; Wed, 27 Oct 2021 22:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217508.377594; Wed, 27 Oct 2021 22:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfrex-0001oD-7P; Wed, 27 Oct 2021 22:44:39 +0000
Received: by outflank-mailman (input) for mailman id 217508;
 Wed, 27 Oct 2021 22:44:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfrev-0001o7-Om
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 22:44:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdcd4a46-f96e-49f3-bed3-53bceeb31ec9;
 Wed, 27 Oct 2021 22:44:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2744600D3;
 Wed, 27 Oct 2021 22:44:35 +0000 (UTC)
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
X-Inumbo-ID: fdcd4a46-f96e-49f3-bed3-53bceeb31ec9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635374676;
	bh=lBCpNJsMYfrZdJ5KdC8o4vtet7JfCHWffWxijhofpDg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bLemXR+aNahY+IUON0o+irgAoSOIesri3u5rHYWrK1zTZDX2wipL6dPtugY1iWyMb
	 U/zGbC509YmXxAzaJ/nodti5lve3pcN0yEb2vjmbl/SF8ytecfHQw+r4w9CdtCcTbv
	 woHt5XDcUYU1Q4xttTlDB7OE07lxBItHumO1qODnOlPLRGVuiK2z0UQzQJv3zK2fwc
	 u8UknqfZlwfRyOYE79ENFnz3x03+ikIrfFY0F3iAmGiMvx8Tk+B2zyonYjSOuC+/AZ
	 FG4clKFvY/8Z76ZvjzCiu4jSutm2ZyprYptuB0suzKwq8PvZ3Fj2Uoe9cgokFp4dj0
	 2YvJy4Rz/NUFg==
Date: Wed, 27 Oct 2021 15:44:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    iwj@xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
In-Reply-To: <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
Message-ID: <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-2-sstabellini@kernel.org> <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com> <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com> <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s> <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1561552572-1635374676=:20134"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1561552572-1635374676=:20134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Juergen Gross wrote:
> On 26.10.21 02:54, Stefano Stabellini wrote:
> > On Mon, 25 Oct 2021, Juergen Gross wrote:
> > > On 22.10.21 21:41, Stefano Stabellini wrote:
> > > > +Juergen
> > > > 
> > > > On Fri, 22 Oct 2021, Andrew Cooper wrote:
> > > > > On 22/10/2021 00:08, Stefano Stabellini wrote:
> > > > > > +# build depends
> > > > > > +RUN apt-get update && \
> > > > > > +    apt-get --quiet --yes install \
> > > > > > +        build-essential \
> > > > > > +        libssl-dev \
> > > > > > +        bc \
> > > > > > +        curl \
> > > > > > +        flex \
> > > > > > +        bison \
> > > > > > +        libelf-dev \
> > > > > > +        && \
> > > > > > +    \
> > > > > > +    # Build the kernel
> > > > > > +    curl -fsSLO
> > > > > > https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz
> > > > > > && \
> > > > > > +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> > > > > > +    cd linux-"$LINUX_VERSION" && \
> > > > > > +    make defconfig && \
> > > > > > +    make xen.config && \
> > > > > > +    cp .config .config.orig && \
> > > > > > +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >>
> > > > > > .config
> > > > > > && \
> > > > > > +    make -j$(nproc) bzImage && \
> > > > > 
> > > > > defconfig is huuuuge.  Can we use tinyconfig instead?
> > > > > 
> > > > > Also, you want to turn off CONFIG_MODULES seeing as you only copy
> > > > > bzImage to the test.
> > > > > 
> > > > > This also fixes the fact that `grep XEN` also matches
> > > > > CONFIG_NETXEN_NIC
> > > > > which has nothing to do with Xen.
> > > > 
> > > > Tinyconfig would be a good idea but it crashes on QEMU with the appended
> > > > boot log. I did:
> > > > 
> > > > # make tinyconfig
> > > > # make xen.config
> > > > # make bzImage
> > > > 
> > > > Of course we could have our own tailored special kernel config for this
> > > > kernel but I like the simplicify of "make tinyconfig" or "make
> > > > defconfig" followed by "make xen.config".
> > > > 
> > > > Unless you know one kconfig option or two that we need to add to
> > > > tinyconfig to make it work my preference is to go with defconfig for
> > > > now.
> > > 
> > > You will need to add the dom0 and SMP related config options at least.
> > > 
> > > I'll have a look at config.xen, which is a little bit weird: it
> > > configures the backends, but not dom0.
> > 
> > Thanks, it would be good if make tinyconfig && make xen.config would
> > just work on QEMU. In the meantime I'll keep defconfig for this test, we
> > can always improve later.
> 
> Can you please test the attached patch?

Yes, that works, thanks!

We don't currently have any patches under automation/ but I guess I
could add this patch under automation/tests-artifacts/kernel/

Cheers,

Stefano
--8323329-1561552572-1635374676=:20134--

