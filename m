Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B21143D779
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 01:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217526.377616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsHq-0006gj-O0; Wed, 27 Oct 2021 23:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217526.377616; Wed, 27 Oct 2021 23:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsHq-0006ef-KU; Wed, 27 Oct 2021 23:24:50 +0000
Received: by outflank-mailman (input) for mailman id 217526;
 Wed, 27 Oct 2021 23:24:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfsHp-0006eZ-Fq
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 23:24:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 126a9885-377d-11ec-848c-12813bfff9fa;
 Wed, 27 Oct 2021 23:24:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BF9D603E8;
 Wed, 27 Oct 2021 23:24:47 +0000 (UTC)
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
X-Inumbo-ID: 126a9885-377d-11ec-848c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635377087;
	bh=HqmB7XSKiNR8LhBrGOSnCWkHbJVha25DbfIuQCSttv0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HnIn6fW7qeVOaXndJ4oFNqapU1vnAmstq6F7ssEJPN1tM6Zn0GcIfYPNkSDXB8V8v
	 bkAWqtcTWyS856ltsT4zqvZFsDyqE+9fiqlgiyK38lHHCZTOASReAGjWtoBE5ydqs3
	 DpxXM6iVfspkYkisgW1vaRJZ6mUMvHWJM8EcLOaa8Tl4Y6iHaLY8EoY/RjSdsc+k/0
	 hA7nMjLK/Ty3KE5mD7DNfa7v1iwTDfh76y9WLOfMxOAoN2/+82ozbByPZJm1rJsF/h
	 TlzmhYcxZ0TdCCuOveAPEtoHu4Tj/DGfZQtdr2fApptXdl/Zg1kIAilrq+TfnAbN36
	 aLAoh2JSCIHCQ==
Date: Wed, 27 Oct 2021 16:24:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
In-Reply-To: <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-2-sstabellini@kernel.org> <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com> <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com> <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s> <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com> <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1515627719-1635377087=:20134"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1515627719-1635377087=:20134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Stefano Stabellini wrote:
> On Wed, 27 Oct 2021, Juergen Gross wrote:
> > On 26.10.21 02:54, Stefano Stabellini wrote:
> > > On Mon, 25 Oct 2021, Juergen Gross wrote:
> > > > On 22.10.21 21:41, Stefano Stabellini wrote:
> > > > > +Juergen
> > > > > 
> > > > > On Fri, 22 Oct 2021, Andrew Cooper wrote:
> > > > > > On 22/10/2021 00:08, Stefano Stabellini wrote:
> > > > > > > +# build depends
> > > > > > > +RUN apt-get update && \
> > > > > > > +    apt-get --quiet --yes install \
> > > > > > > +        build-essential \
> > > > > > > +        libssl-dev \
> > > > > > > +        bc \
> > > > > > > +        curl \
> > > > > > > +        flex \
> > > > > > > +        bison \
> > > > > > > +        libelf-dev \
> > > > > > > +        && \
> > > > > > > +    \
> > > > > > > +    # Build the kernel
> > > > > > > +    curl -fsSLO
> > > > > > > https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz
> > > > > > > && \
> > > > > > > +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> > > > > > > +    cd linux-"$LINUX_VERSION" && \
> > > > > > > +    make defconfig && \
> > > > > > > +    make xen.config && \
> > > > > > > +    cp .config .config.orig && \
> > > > > > > +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >>
> > > > > > > .config
> > > > > > > && \
> > > > > > > +    make -j$(nproc) bzImage && \
> > > > > > 
> > > > > > defconfig is huuuuge.  Can we use tinyconfig instead?
> > > > > > 
> > > > > > Also, you want to turn off CONFIG_MODULES seeing as you only copy
> > > > > > bzImage to the test.
> > > > > > 
> > > > > > This also fixes the fact that `grep XEN` also matches
> > > > > > CONFIG_NETXEN_NIC
> > > > > > which has nothing to do with Xen.
> > > > > 
> > > > > Tinyconfig would be a good idea but it crashes on QEMU with the appended
> > > > > boot log. I did:
> > > > > 
> > > > > # make tinyconfig
> > > > > # make xen.config
> > > > > # make bzImage
> > > > > 
> > > > > Of course we could have our own tailored special kernel config for this
> > > > > kernel but I like the simplicify of "make tinyconfig" or "make
> > > > > defconfig" followed by "make xen.config".
> > > > > 
> > > > > Unless you know one kconfig option or two that we need to add to
> > > > > tinyconfig to make it work my preference is to go with defconfig for
> > > > > now.
> > > > 
> > > > You will need to add the dom0 and SMP related config options at least.
> > > > 
> > > > I'll have a look at config.xen, which is a little bit weird: it
> > > > configures the backends, but not dom0.
> > > 
> > > Thanks, it would be good if make tinyconfig && make xen.config would
> > > just work on QEMU. In the meantime I'll keep defconfig for this test, we
> > > can always improve later.
> > 
> > Can you please test the attached patch?
> 
> Yes, that works, thanks!

Sorry, I spoke too soon: same error as before:

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1722909607/raw

(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.

No output from the kernel.

By the way you can repro this at your end by doing the following:

# docker run -v /tmp:/tmp registry.gitlab.com/xen-project/xen/debian:stretch

Then inside the container follow pretty much what this script does:

xen.git/automation/scripts/qemu-alpine-x86_64.sh

For instance, you can do:

---
cat >> binaries/pxelinux.0 << EOF
#!ipxe

kernel /tmp/xen console=com1
module /tmp/bzImage console=hvc0
module /tmp/xen-rootfs.cpio.gz
boot
EOF

qemu-system-x86_64 \
    -cpu qemu64,+svm \
    -m 2G -smp 2 \
    -monitor none -serial stdio \
    -nographic \
    -device virtio-net-pci,netdev=n0 \
    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0
---

Just place your xen, bzImage and xen-rootfs.cpio.gz (the rootfs is not
required) binaries under /tmp and you are good to go.

Cheers,

Stefano
--8323329-1515627719-1635377087=:20134--

