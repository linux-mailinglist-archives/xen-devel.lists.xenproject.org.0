Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EC1C77A4
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 19:18:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWNfA-0005qW-QY; Wed, 06 May 2020 17:16:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZA5M=6U=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jWNf8-0005qR-Vc
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 17:16:51 +0000
X-Inumbo-ID: 5f5ed380-8fbd-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f5ed380-8fbd-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 17:16:50 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49CED20708;
 Wed,  6 May 2020 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588785409;
 bh=Z6i2tGad7I5om8sKqamcWlkOEEXLp2HDAdb+ww7BBt8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Wh5LqfVDBWL0H0ggLZnIlJ+CT3Y7OxDeYlhpseLtfuNJA6fdkW8kgQGP3+btRIMzt
 wqDUv3ccqA9HTkBx1nNzGGVjX1Y+Aa/iKHDzklJv3LaVRGq9oYC+jLoU4jA2ROtaRS
 XVOMCEMSxVTGLuuxfs839h1YkbckYWtcaP/jABBs=
Date: Wed, 6 May 2020 10:16:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
Subject: RE: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
In-Reply-To: <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2005061015050.14706@sstabellini-ThinkPad-T480s>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
 <ed02b555-dbaa-2ebf-d09f-0474e1a7a745@xen.org>
 <20200504124453.GI9902@minyard.net>
 <CAMmSBy-w1HOyGGCjB_nJcn2xw+4sNdDrtJ8PC3foaxJOtdRmnQ@mail.gmail.com>
 <alpine.DEB.2.21.2005042004500.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1151900323-1588785409=:14706"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "minyard@acm.org" <minyard@acm.org>, Roman Shaposhnik <roman@zededa.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1151900323-1588785409=:14706
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 6 May 2020, Peng Fan wrote:
> > Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
> > 
> > On 06.05.20 00:34, Stefano Stabellini wrote:
> > > + Boris, Jürgen
> > >
> > > See the crash Roman is seeing booting dom0 on the Raspberry Pi. It is
> > > related to the recent xen dma_ops changes. Possibly the same thing
> > > reported by Peng here:
> 
> Yes. It is same issue.
> 
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fmarc
> > > .info%2F%3Fl%3Dlinux-kernel%26m%3D158805976230485%26w%3D2&am
> > p;data=02%
> > >
> > 7C01%7Cpeng.fan%40nxp.com%7Cab98b2db94484141a8ad08d7f1803372%7
> > C686ea1d
> > >
> > 3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637243405233572354&amp;sd
> > ata=0Yr5h
> > > Rg4%2FuApsBpTwIIL4StZU%2FUA55oP5Lfnfmtj4Hg%3D&amp;reserved=0
> > >
> > > An in-depth analysis below.
> > >
> > >
> > > On Mon, 4 May 2020, Roman Shaposhnik wrote:
> > >>>> [    2.534292] Unable to handle kernel paging request at virtual
> > >>>> address 000000000026c340
> > >>>> [    2.542373] Mem abort info:
> > >>>> [    2.545257]   ESR = 0x96000004
> > >>>> [    2.548421]   EC = 0x25: DABT (current EL), IL = 32 bits
> > >>>> [    2.553877]   SET = 0, FnV = 0
> > >>>> [    2.557023]   EA = 0, S1PTW = 0
> > >>>> [    2.560297] Data abort info:
> > >>>> [    2.563258]   ISV = 0, ISS = 0x00000004
> > >>>> [    2.567208]   CM = 0, WnR = 0
> > >>>> [    2.570294] [000000000026c340] user address but active_mm is
> > swapper
> > >>>> [    2.576783] Internal error: Oops: 96000004 [#1] SMP
> > >>>> [    2.581784] Modules linked in:
> > >>>> [    2.584950] CPU: 3 PID: 135 Comm: kworker/3:1 Not tainted
> > 5.6.1-default #9
> > >>>> [    2.591970] Hardware name: Raspberry Pi 4 Model B (DT)
> > >>>> [    2.597256] Workqueue: events deferred_probe_work_func
> > >>>> [    2.602509] pstate: 60000005 (nZCv daif -PAN -UAO)
> > >>>> [    2.607431] pc : xen_swiotlb_free_coherent+0x198/0x1d8
> > >>>> [    2.612696] lr : dma_free_attrs+0x98/0xd0
> > >>>> [    2.616827] sp : ffff800011db3970
> > >>>> [    2.620242] x29: ffff800011db3970 x28: 00000000000f7b00
> > >>>> [    2.625695] x27: 0000000000001000 x26: ffff000037b68410
> > >>>> [    2.631129] x25: 0000000000000001 x24: 00000000f7b00000
> > >>>> [    2.636583] x23: 0000000000000000 x22: 0000000000000000
> > >>>> [    2.642017] x21: ffff800011b0d000 x20: ffff80001179b548
> > >>>> [    2.647461] x19: ffff000037b68410 x18: 0000000000000010
> > >>>> [    2.652905] x17: ffff000035d66a00 x16: 00000000deadbeef
> > >>>> [    2.658348] x15: ffffffffffffffff x14: ffff80001179b548
> > >>>> [    2.663792] x13: ffff800091db37b7 x12: ffff800011db37bf
> > >>>> [    2.669236] x11: ffff8000117c7000 x10: ffff800011db3740
> > >>>> [    2.674680] x9 : 00000000ffffffd0 x8 : ffff80001071e980
> > >>>> [    2.680124] x7 : 0000000000000132 x6 : ffff80001197a6ab
> > >>>> [    2.685568] x5 : 0000000000000000 x4 : 0000000000000000
> > >>>> [    2.691012] x3 : 00000000f7b00000 x2 : fffffdffffe00000
> > >>>> [    2.696465] x1 : 000000000026c340 x0 : 000002000046c340
> > >>>> [    2.701899] Call trace:
> > >>>> [    2.704452]  xen_swiotlb_free_coherent+0x198/0x1d8
> > >>>> [    2.709367]  dma_free_attrs+0x98/0xd0
> > >>>> [    2.713143]  rpi_firmware_property_list+0x1e4/0x240
> > >>>> [    2.718146]  rpi_firmware_property+0x6c/0xb0
> > >>>> [    2.722535]  rpi_firmware_probe+0xf0/0x1e0
> > >>>> [    2.726760]  platform_drv_probe+0x50/0xa0
> > >>>> [    2.730879]  really_probe+0xd8/0x438
> > >>>> [    2.734567]  driver_probe_device+0xdc/0x130
> > >>>> [    2.738870]  __device_attach_driver+0x88/0x108
> > >>>> [    2.743434]  bus_for_each_drv+0x78/0xc8
> > >>>> [    2.747386]  __device_attach+0xd4/0x158
> > >>>> [    2.751337]  device_initial_probe+0x10/0x18
> > >>>> [    2.755649]  bus_probe_device+0x90/0x98
> > >>>> [    2.759590]  deferred_probe_work_func+0x88/0xd8
> > >>>> [    2.764244]  process_one_work+0x1f0/0x3c0
> > >>>> [    2.768369]  worker_thread+0x138/0x570
> > >>>> [    2.772234]  kthread+0x118/0x120
> > >>>> [    2.775571]  ret_from_fork+0x10/0x18
> > >>>> [    2.779263] Code: d34cfc00 f2dfbfe2 d37ae400 8b020001
> > (f8626800)
> > >>>> [    2.785492] ---[ end trace 4c435212e349f45f ]---
> > >>>> [    2.793340] usb 1-1: New USB device found, idVendor=2109,
> > >>>> idProduct=3431, bcdDevice= 4.20
> > >>>> [    2.801038] usb 1-1: New USB device strings: Mfr=0, Product=1,
> > SerialNumber=0
> > >>>> [    2.808297] usb 1-1: Product: USB2.0 Hub
> > >>>> [    2.813710] hub 1-1:1.0: USB hub found
> > >>>> [    2.817117] hub 1-1:1.0: 4 ports detected
> > >>>>
> > >>>> This is bailing out right here:
> > >>>>
> > >>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fg
> > >>>>
> > it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux.g
> > >>>>
> > it%2Ftree%2Fdrivers%2Ffirmware%2Fraspberrypi.c%3Fh%3Dv5.6.1%23n125
> > &
> > >>>>
> > amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cab98b2db94484141a8ad0
> > 8d7f18
> > >>>>
> > 03372%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6372434052
> > 335723
> > >>>>
> > 54&amp;sdata=h1dyHkb%2FsifUqH3Z0m3uIIcqUhXVwhHS%2Ft%2FVvig%2Fo
> > u4%3D
> > >>>> &amp;reserved=0
> > >>>>
> > >>>> FYIW (since I modified the source to actually print what was
> > >>>> returned right before it bails) we get:
> > >>>>     buf[1] == 0x800000004
> > >>>>     buf[2] == 0x00000001
> > >>>>
> > >>>> Status 0x800000004 is of course suspicious since it is not even listed
> > here:
> > >>>>
> > >>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fg
> > >>>>
> > it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux.g
> > >>>>
> > it%2Ftree%2Finclude%2Fsoc%2Fbcm2835%2Fraspberrypi-firmware.h%23n14
> > &
> > >>>>
> > amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cab98b2db94484141a8ad0
> > 8d7f18
> > >>>>
> > 03372%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6372434052
> > 335723
> > >>>>
> > 54&amp;sdata=3yMm%2FujHCVf%2FigpNLE8hcBWVcvdGrZGv5TuqeMzMV0
> > U%3D&amp
> > >>>> ;reserved=0
> > >>>>
> > >>>> So it appears that this DMA request path is somehow busted and it
> > >>>> would be really nice to figure out why.
> > >>>
> > >>> You have actually discovered a genuine bug in the recent xen dma
> > >>> rework in Linux. Congrats :-)
> > >>
> > >> Nice! ;-)
> > >>
> > >>> I am doing some guesswork here, but from what I read in the thread
> > >>> and the information in this email I think this patch might fix the issue.
> > >>> If it doesn't fix the issue please add a few printks in
> > >>> drivers/xen/swiotlb-xen.c:xen_swiotlb_free_coherent and please let
> > >>> me know where exactly it crashes.
> > >>>
> > >>>
> > >>> diff --git a/include/xen/arm/page-coherent.h
> > >>> b/include/xen/arm/page-coherent.h index b9cc11e887ed..ff4677ed9788
> > >>> 100644
> > >>> --- a/include/xen/arm/page-coherent.h
> > >>> +++ b/include/xen/arm/page-coherent.h
> > >>> @@ -8,12 +8,17 @@
> > >>>   static inline void *xen_alloc_coherent_pages(struct device *hwdev,
> > size_t size,
> > >>>                  dma_addr_t *dma_handle, gfp_t flags, unsigned
> > long attrs)
> > >>>   {
> > >>> +       void *cpu_addr;
> > >>> +       if (dma_alloc_from_dev_coherent(hwdev, size, dma_handle,
> > &cpu_addr))
> > >>> +               return cpu_addr;
> > >>>          return dma_direct_alloc(hwdev, size, dma_handle, flags,
> > attrs);
> > >>>   }
> > >>>
> > >>>   static inline void xen_free_coherent_pages(struct device *hwdev,
> > size_t size,
> > >>>                  void *cpu_addr, dma_addr_t dma_handle,
> > unsigned long attrs)
> > >>>   {
> > >>> +       if (dma_release_from_dev_coherent(hwdev, get_order(size),
> > cpu_addr))
> > >>> +               return;
> > >>>          dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
> > >>>   }
> > >>
> > >> Applied the patch, but it didn't help and after printk's it turns out
> > >> it surprisingly crashes right inside this (rather convoluted if you
> > >> ask me) if statement:
> > >>
> > >> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit
> > >> .kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fstable%2Flinux.gi
> > t%2
> > >>
> > Ftree%2Fdrivers%2Fxen%2Fswiotlb-xen.c%3Fh%3Dv5.6.1%23n349&amp;dat
> > a=02
> > >> %7C01%7Cpeng.fan%40nxp.com%7Cab98b2db94484141a8ad08d7f18033
> > 72%7C686ea
> > >>
> > 1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637243405233572354&amp;
> > sdata=Fu
> > >>
> > BWGAEg%2FkbsnYIIGHmiICTqy%2BcgZs7V%2BMneJum%2BTts%3D&amp;res
> > erved=0
> > >>
> > >> So it makes sense that the patch didn't help -- we never hit that
> > >> xen_free_coherent_pages.
> > >
> > > The crash happens here:
> > >
> > > 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> > > 		     range_straddles_page_boundary(phys, size)) &&
> > > 	    TestClearPageXenRemapped(virt_to_page(vaddr)))
> > > 		xen_destroy_contiguous_region(phys, order);
> > >
> > > I don't know exactly what is causing the crash. Is it the WARN_ON
> > somehow?
> > > Is it TestClearPageXenRemapped? Neither should cause a crash in theory.
> > >
> > >
> > > But I do know that there are problems with that if statement on ARM.
> > > It can trigger for one of the following conditions:
> > >
> > > 1) dev_addr + size - 1 > dma_mask
> > > 2) range_straddles_page_boundary(phys, size)
> 
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index bd3a10dfac15..33b027cb0b2a 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -346,6 +346,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>         /* Convert the size to actually allocated. */
>         size = 1UL << (order + XEN_PAGE_SHIFT);
> 
> +       printk("%x %x %px %x %px\n", dev_addr + size - 1 > dma_mask, range_straddles_page_boundary(phys, size), virt_to_page(vaddr), phys, vaddr);
>         if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>                      range_straddles_page_boundary(phys, size)) &&
>             TestClearPageXenRemapped(virt_to_page(vaddr)))
> 
> 
> In my case:
> 0 0 0000000000271f40 bc000000 ffff800011c7d000
> 
> 
> The alloc path in my side:
> 314         phys = *dma_handle;
> 315         dev_addr = xen_phys_to_bus(phys);
> 316         if (((dev_addr + size - 1 <= dma_mask)) &&
> 317             !range_straddles_page_boundary(phys, size))
> 318                 *dma_handle = dev_addr;
> 
> So I am confused why the free path needs clear xen remap.

Thanks this is useful information, now I understand what is going on.

In your case it shouldn't take the if path in xen_swiotlb_free_coherent
at all, but still should evaluate the if condition. So the if would
return false for you, but you can't finish evaluating the if because
virt_to_page causes a crash.
--8323329-1151900323-1588785409=:14706--

