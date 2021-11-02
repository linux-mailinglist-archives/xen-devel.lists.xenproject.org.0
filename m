Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13713442485
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 01:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219615.380476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhhPY-00007u-3u; Tue, 02 Nov 2021 00:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219615.380476; Tue, 02 Nov 2021 00:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhhPX-00004s-W9; Tue, 02 Nov 2021 00:12:19 +0000
Received: by outflank-mailman (input) for mailman id 219615;
 Tue, 02 Nov 2021 00:12:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8t6=PV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mhhPW-0008WS-Fp
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 00:12:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89b96620-3b71-11ec-854e-12813bfff9fa;
 Tue, 02 Nov 2021 00:12:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C23960EBC;
 Tue,  2 Nov 2021 00:12:16 +0000 (UTC)
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
X-Inumbo-ID: 89b96620-3b71-11ec-854e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635811936;
	bh=ia6BxbBShWSVuQ1UF4w+m4ait06Xt/Y322Pb2NRdBVQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fIC8AjPtPRBp/kAlDEqLsPOXjWUxSoqDIT39f0GYfYl3HDmjiB2ofgTmjt3N4oapY
	 f9kr2bCFoUTwD36ZlH2m7o4aDkpESFRKmSYF9s7Syh7/0PB7KEyy7ruBpg3n1ttzgH
	 WIBh4tOqAYyJRj7ujenxJFKhFWaFPbYYSsV69+rofEYbyZgk26Kiyo6TPsk3kASDhz
	 2JeQyF55orbT1F7LR2S0EWSEs9oCvFxjrcppkjz/40wtlAs7Hd4LsyRokx6UBrtPKn
	 tZ2xDRFP1gW9Q+WYCj2Tni0cJp0YCXzEFjoCNU6yUm6/e23hlA58cp0ty5Gqy1V8Ue
	 RuBU8H3sT1thQ==
Date: Mon, 1 Nov 2021 17:12:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    iwj@xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
In-Reply-To: <bf4c4138-2bd3-4fcb-b279-9f21495a20cc@suse.com>
Message-ID: <alpine.DEB.2.21.2111011711230.20134@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-2-sstabellini@kernel.org> <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com> <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com> <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s> <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com> <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s> <4f82901a-2e74-f4ee-311e-b8187d856745@suse.com> <alpine.DEB.2.21.2110280939130.20134@sstabellini-ThinkPad-T480s> <bf4c4138-2bd3-4fcb-b279-9f21495a20cc@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1782439853-1635811936=:20134"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1782439853-1635811936=:20134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 29 Oct 2021, Juergen Gross wrote:
> On 28.10.21 18:41, Stefano Stabellini wrote:
> > On Thu, 28 Oct 2021, Juergen Gross wrote:
> > > On 28.10.21 01:24, Stefano Stabellini wrote:
> > > > On Wed, 27 Oct 2021, Stefano Stabellini wrote:
> > > > > On Wed, 27 Oct 2021, Juergen Gross wrote:
> > > > > > On 26.10.21 02:54, Stefano Stabellini wrote:
> > > > > > > On Mon, 25 Oct 2021, Juergen Gross wrote:
> > > > > > > > On 22.10.21 21:41, Stefano Stabellini wrote:
> > > > > > > > > +Juergen
> > > > > > > > > 
> > > > > > > > > On Fri, 22 Oct 2021, Andrew Cooper wrote:
> > > > > > > > > > On 22/10/2021 00:08, Stefano Stabellini wrote:
> > > > > > > > > > > +# build depends
> > > > > > > > > > > +RUN apt-get update && \
> > > > > > > > > > > +    apt-get --quiet --yes install \
> > > > > > > > > > > +        build-essential \
> > > > > > > > > > > +        libssl-dev \
> > > > > > > > > > > +        bc \
> > > > > > > > > > > +        curl \
> > > > > > > > > > > +        flex \
> > > > > > > > > > > +        bison \
> > > > > > > > > > > +        libelf-dev \
> > > > > > > > > > > +        && \
> > > > > > > > > > > +    \
> > > > > > > > > > > +    # Build the kernel
> > > > > > > > > > > +    curl -fsSLO
> > > > > > > > > > > https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz
> > > > > > > > > > > && \
> > > > > > > > > > > +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> > > > > > > > > > > +    cd linux-"$LINUX_VERSION" && \
> > > > > > > > > > > +    make defconfig && \
> > > > > > > > > > > +    make xen.config && \
> > > > > > > > > > > +    cp .config .config.orig && \
> > > > > > > > > > > +    cat .config.orig | grep XEN | grep =m |sed
> > > > > > > > > > > 's/=m/=y/g' >>
> > > > > > > > > > > .config
> > > > > > > > > > > && \
> > > > > > > > > > > +    make -j$(nproc) bzImage && \
> > > > > > > > > > 
> > > > > > > > > > defconfig is huuuuge.  Can we use tinyconfig instead?
> > > > > > > > > > 
> > > > > > > > > > Also, you want to turn off CONFIG_MODULES seeing as you only
> > > > > > > > > > copy
> > > > > > > > > > bzImage to the test.
> > > > > > > > > > 
> > > > > > > > > > This also fixes the fact that `grep XEN` also matches
> > > > > > > > > > CONFIG_NETXEN_NIC
> > > > > > > > > > which has nothing to do with Xen.
> > > > > > > > > 
> > > > > > > > > Tinyconfig would be a good idea but it crashes on QEMU with
> > > > > > > > > the
> > > > > > > > > appended
> > > > > > > > > boot log. I did:
> > > > > > > > > 
> > > > > > > > > # make tinyconfig
> > > > > > > > > # make xen.config
> > > > > > > > > # make bzImage
> > > > > > > > > 
> > > > > > > > > Of course we could have our own tailored special kernel config
> > > > > > > > > for
> > > > > > > > > this
> > > > > > > > > kernel but I like the simplicify of "make tinyconfig" or "make
> > > > > > > > > defconfig" followed by "make xen.config".
> > > > > > > > > 
> > > > > > > > > Unless you know one kconfig option or two that we need to add
> > > > > > > > > to
> > > > > > > > > tinyconfig to make it work my preference is to go with
> > > > > > > > > defconfig
> > > > > > > > > for
> > > > > > > > > now.
> > > > > > > > 
> > > > > > > > You will need to add the dom0 and SMP related config options at
> > > > > > > > least.
> > > > > > > > 
> > > > > > > > I'll have a look at config.xen, which is a little bit weird: it
> > > > > > > > configures the backends, but not dom0.
> > > > > > > 
> > > > > > > Thanks, it would be good if make tinyconfig && make xen.config
> > > > > > > would
> > > > > > > just work on QEMU. In the meantime I'll keep defconfig for this
> > > > > > > test,
> > > > > > > we
> > > > > > > can always improve later.
> > > > > > 
> > > > > > Can you please test the attached patch?
> > > > > 
> > > > > Yes, that works, thanks!
> > > > 
> > > > Sorry, I spoke too soon: same error as before:
> > > > 
> > > > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1722909607/raw
> > > > 
> > > > (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> > > > 
> > > > No output from the kernel.
> > > 
> > > This is not very surprising, as tinyconfig doesn't have CONFIG_PRINTK.
> > > BTW, it doesn't have initrd support either (BLK_DEV_RAM and
> > > BLK_DEV_INITRD), so I added those to xen.config as well.
> > > 
> > > With the (updated) attached patch the kernel boots fine as dom0 until
> > > rootfs is tried to be mounted on a physical machine.
> > > 
> > > I've added CONFIG_BUG, too, in order to have more debugging output if
> > > needed.
> > 
> > Much better, now there is output:
> > https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1726396600/raw
> > 
> > This kernel is used as dom0 and from the logs it looks like for dom0 we
> > need a couple more things:
> > - flocks
> 
> CONFIG_FILE_LOCKING probably wants to be added.
> 
> > - the kconfig to recognize #!/bin/sh
> 
> This is probably CONFIG_BINFMT_SCRIPT.
> 
> I'm not sure those should be added to the upstream xen.config.

I don't know either... They are certainly required for dom0, but not for
domU. Do we want xen.config to be for domU only or for domU and dom0? If
we want it to be for both, then CONFIG_FILE_LOCKING and
CONFIG_BINFMT_SCRIPT should be added otherwise not.
--8323329-1782439853-1635811936=:20134--

