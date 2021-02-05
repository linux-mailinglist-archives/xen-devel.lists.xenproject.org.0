Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08031022B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 02:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81483.150681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ppz-0007L8-L8; Fri, 05 Feb 2021 01:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81483.150681; Fri, 05 Feb 2021 01:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7ppz-0007Kj-Hx; Fri, 05 Feb 2021 01:23:07 +0000
Received: by outflank-mailman (input) for mailman id 81483;
 Fri, 05 Feb 2021 01:23:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kT56=HH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l7ppy-0007Ke-3b
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 01:23:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0c88f42-86d6-4283-ad45-ba418021db27;
 Fri, 05 Feb 2021 01:23:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BF9964FB0;
 Fri,  5 Feb 2021 01:23:04 +0000 (UTC)
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
X-Inumbo-ID: e0c88f42-86d6-4283-ad45-ba418021db27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612488184;
	bh=PItTdRKiVSD2caMBRqMvkQCLWOB3928cKd3ymKxTe3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UQZrpyddxze7Ih3JMuySrWgzpEvVuCBiSj9JXdxgH6sgsepgMx4EDrSbE24Cs67nk
	 jx+nzlVjb8US2E/nRVfMTgXqZB7TJ/UpGLB8HKg2KDmYxcP9zRM2FkvbNLLl9rkwxe
	 SKC6k0jTECi5CDS7WYIegHKH8HlL8Dt8sW5fXlA+zGG38SmogrIwgyzoo9J87Bw9oC
	 Vgi26YRr4EVZsiAYticoLBdrb8ZYQIz93pHZrnKunaQKMjf8NwnRoo9HQu84SemHsv
	 bGLkmHQmlp76i5cqqR3B53AFzYpuLmfuExSj2n/adQDqUUdWwHFZzGzUFj+8luzldw
	 yDsP6RFSsksbA==
Date: Thu, 4 Feb 2021 17:23:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Roman Shaposhnik <roman@zededa.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <6a0dab88-aede-f048-fb86-b2a786ac3674@unikie.com>
Message-ID: <alpine.DEB.2.21.2102041711510.29047@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com> <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com> <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com> <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s> <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com> <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com> <c44d45ed-f03e-e901-4a46-0ce57504703f@xen.org> <alpine.DEB.2.21.2102011055080.29047@sstabellini-ThinkPad-T480s> <6a0dab88-aede-f048-fb86-b2a786ac3674@unikie.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Feb 2021, Jukka Kaartinen wrote:
> We really need direct HW access so PVFB is not really an option. And at this
> point. We can trust the VMs.
> 
> 
> Any idea what am I missing something here is this the way to give domu access
> to the memory?
> 
> # from dom0: cat /proc/iomem
> # fe104000-fe104027 : fe104000.rng rng@7e104000
> 
> # to hide the above rng from the dom0 I added these to device-tree and above
> line from /proc/iomem dissapiered.
> boot2.scr:
> fdt set /soc/rng@7e104000 xen,passthrough <0x1>
> fdt set /soc/rng@7e104000 status disabled

Leave status to enabled or okay, just set xen,passthrough to 0x1.

 
> domu.cfg:
> iomem = [ 'fe104,1' ]
> 
> domu start but I cannot see that address in the domu iomem range.
> Also the device-tree from the domu is quite empty.
> 
> Do I need something like:
> device_tree = "rng.dtb"
> 
> like here:
> https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg02618.html
> 
> 
> I tried to add
> dtdev = [ "/soc/rng@7e104000" ]

Yes you need both dtdev and device_tree, see
https://xenbits.xenproject.org/docs/unstable/misc/arm/passthrough.txt

iomem is to remap memory regions
irqs is to remap interrupts
device_tree is to populate the DomU device tree
dtdev is to setup the IOMMU, linking to the original device in the host DT


> but this gives be error:
> "libxl: error: libxl_create.c:1107:libxl__domain_config_setdefault:
> passthrough not supported on this platform"
> 
> Will this happen if generate the rng.dtb?

This usually happens because there is no IOMMU on the board, or the
IOMMU is disabled. Indeed, the Raspberry Pi 4 doesn't seem to have one.

Now this is going to make things more difficult: without the IOMMU there
can be no protection. In addition, we have a problem with address
translations: when the domU programs a device to do DMA, it uses its
"fake" pseudo-physical addresses. When the device starts the DMA
transaction with the "fake" address, the IOMMU translates it back to a
real physical address.

For this reason, there is no way to assign a device to a domU without
IOMMU on upstream Xen. However, I sent out a patch series a while back
to allow to create domUs with memory 1:1 mapped (pseudo-physical ==
physical). With those patches applied, there is no issue with address
translations anymore and you can assign a device to a domU even without
IOMMU. However, keep in mind that there is going to be no protection.
The series only works for dom0less domUs for now, but it shouldn't be
hard to make it work for any other domUs.

You can find the series here in the Xilinx Xen branch:
https://github.com/Xilinx/xen/tree/xilinx/release-2020.2

and specifically the relevant patches start here:
https://github.com/Xilinx/xen/commit/b8953d357aa095d1027156cf386ad37bd8a34da5

up until:
https://github.com/Xilinx/xen/commit/a7b332c420da40aa3192a8b77c65bcdb1935b5ab

