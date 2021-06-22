Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCEF3B0F3F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 23:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146093.268743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvnbo-0006im-Vi; Tue, 22 Jun 2021 21:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146093.268743; Tue, 22 Jun 2021 21:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvnbo-0006gU-Rx; Tue, 22 Jun 2021 21:07:00 +0000
Received: by outflank-mailman (input) for mailman id 146093;
 Tue, 22 Jun 2021 21:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKzY=LQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lvnbn-0006gO-4r
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 21:06:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7069e148-3d84-4315-8a0c-80f89a771609;
 Tue, 22 Jun 2021 21:06:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C7A061001;
 Tue, 22 Jun 2021 21:06:57 +0000 (UTC)
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
X-Inumbo-ID: 7069e148-3d84-4315-8a0c-80f89a771609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624396017;
	bh=ErG3K5MuQrOEmX4SnKcaihrG+b9kb2e1ERDZE7FGN8M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mZIyJAmKOvesLYQLDoIbFdEQzYTGHB2H8MZRjAgf3sUo3Ll3A0f2OdDwtqAxh1aSl
	 78F0epC30//7iAej9ekmTTzFuhpjM857uxS7fOKTktHVyvK7A/1ZpnRgPUVkp4D6R+
	 SZjxz6tqK1lUNO/H8dpEaGHPrshBPut80pjHT4fee73Z/X6ESHpqFls7IapnO5jqAc
	 EUhgFL6Iu0jhxMrThlYemLMjk8kebbPG6zGqCnlSwvLnkubz8H28+B1RY2LVESYy1N
	 30qJqeSFC4b80P5vc+MUpCC57en5cG5LPAdslsph9fvwc2iezHsw5W1hXDaQkJbZvS
	 d5VD+OhW/9zlQ==
Date: Tue, 22 Jun 2021 14:06:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul.Singh@arm.com
cc: "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    "fnuv@xilinx.com" <fnuv@xilinx.com>, sstabellini@kernel.org
Subject: Re: smmuv1 breakage
In-Reply-To: <alpine.DEB.2.21.2106151756190.24906@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2106221405220.24906@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2106141840150.24906@sstabellini-ThinkPad-T480s> <791BFC00-6A50-48D2-A208-E529B887441F@arm.com> <alpine.DEB.2.21.2106151756190.24906@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1392728712-1624396017=:24906"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1392728712-1624396017=:24906
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Rahul,

Do you have an opinion on how we should move forward on this?

Do you think it is OK to go for a full revert of "xen/arm: smmuv1:
Intelligent SMR allocation" or do you think it is best to go with an
alternative fix? If so, do you have something in mind?



On Tue, 15 Jun 2021, Stefano Stabellini wrote:
> On Tue, 15 Jun 2021, Rahul Singh wrote:
> > Hi Stefano
> > 
> > > On 15 Jun 2021, at 3:21 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > 
> > > Hi Rahul,
> > > 
> > > Unfortunately, after bisecting, I discovered a few more breakages due to
> > > your smmuv1 series (commits e889809b .. 3e6047ddf) on Xilinx ZynqMP. I
> > > attached the DTB as reference. Please note that I made sure to
> > > cherry-pick "xen/arm: smmuv1: Revert associating the group pointer with
> > > the S2CR" during bisection. So the errors are present also on staging.
> > > 
> > > The first breakage is an error at boot time in smmu.c#find_smmu_master,
> > > see log1. I think it is due to the lack of ability to parse the new smmu
> > > bindings in the old smmu driver.
> > > 
> > > After removing all the "smmus" and "#stream-id-cells" properties in
> > > device tree, I get past the previous error, everything seems to be OK at
> > > early boot, but I actually get SMMU errors as soon as dom0 starting
> > > using devices:
> > > 
> > > (XEN) smmu: /smmu@fd800000: Unexpected global fault, this could be serious
> > > (XEN) smmu: /smmu@fd800000:     GFSR 0x80000002, GFSYNR0 0x00000000, GFSYNR1 0x00000877, GFSYNR2 0x00000000
> > 
> >  This fault is "Unidentified stream fault” for StreamID “ 0x877” that means SMMU SMR is not configured for streamID “0x877"
> > 
> > 
> > > [   10.419681] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> > > [   10.426452] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> > > 
> > > Do you think you'll be able to help fix them?
> > > 
> > > 
> > > You should be able to reproduce the two issues using Xilinx QEMU (but to
> > > be honest I haven't tested it on QEMU yet, I was testing on real
> > > hardware):
> > > - clone and compile xilinx QEMU https://github.com/Xilinx/qemu.git
> > >  ./configure  --target-list=aarch64-softmmu
> > >  make
> > > - clone and build git://github.com/Xilinx/qemu-devicetrees.git
> > > - use the attached script to run it
> > >    - kernel can be upstream defconfig 5.10
> > > 
> > 
> > I tried to reproduce the issue on Xilinx QEMU as per the steps shared above 
> > but I am not observing any issue on Xilinx QEMU.
> 
> I tried on QEMU and it doesn't repro. I cannot explain why it works on
> QEMU and it fails on real hardware.
> 
> 
> > I also tested and confirmed on QEMU that SMMU is configured correctly 
> > for specifically StreamID “ 0x877” and for other streamIDs.
> > 
> > I check the xen.dtb shared by you and found out the there is no "stream-id-cells”
> > property in the master device but the "mmu-masters" property is present in the
> > smmu node. For legacy smmu binding we need both "stream-id-cells” and "mmu-masters”.
> > If you need to add the new smmu binding please add the "iommu-cells”
> > property in the smmu node and the “iommus” property in the master device.
> 
> In regards to the missing "stream-id-cells" property, I shared the wrong
> dtb before, sorry. I was running a number of tests and I might have
> picked the wrong file. The proper dtb comes with "stream-id-cells" for
> the 0x877 device, see attached.
> 
> 
> 
> > Can you please share the xen boot logs with me so that I can debug further why the error is observed? 
> 
> See attached. I did some debugging and discovered that it crashes while
> accessing master->of_node in find_smmu_master. If I revert your series,
> the crash goes away. It is very strange because your patches don't touch
> find_smmu_master or insert_smmu_master directly.
> 
> I did a git reset --hard on the commit "xen/arm: smmuv1: Add a stream
> map entry iterator" and it worked, which points to "xen/arm: smmuv1:
> Intelligent SMR allocation" being the problem, even if I have the revert
> cherry-picked on top. Maybe the revert is not reverting enough?
> 
> After this test, I switched back to staging and did:
> git revert 9f6cd4983715cb31f0ea540e6bbb63f799a35d8a
> git revert 0435784cc75dcfef3b5f59c29deb1dbb84265ddb
> 
> And it worked! So the issue truly is that
> 9f6cd4983715cb31f0ea540e6bbb63f799a35d8a doesn't revert "enough".
> See "full-revert" for the patch reverting the remaining code. That on
> top of staging fixes boot for me.
--8323329-1392728712-1624396017=:24906--

