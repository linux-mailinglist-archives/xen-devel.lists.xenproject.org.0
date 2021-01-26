Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C823049FC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 21:22:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75478.135933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Uqw-0004EV-UJ; Tue, 26 Jan 2021 20:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75478.135933; Tue, 26 Jan 2021 20:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Uqw-0004E6-QV; Tue, 26 Jan 2021 20:22:18 +0000
Received: by outflank-mailman (input) for mailman id 75478;
 Tue, 26 Jan 2021 20:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4Uqv-0004E1-2p
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 20:22:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe144565-8cfa-4632-aefd-7b285b3ff5a8;
 Tue, 26 Jan 2021 20:22:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AE0122241;
 Tue, 26 Jan 2021 20:22:15 +0000 (UTC)
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
X-Inumbo-ID: fe144565-8cfa-4632-aefd-7b285b3ff5a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611692535;
	bh=7cSwTmFZN/o89cB7vKgfRV5Yb94rlA3a4HSv/U4LFGk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aH2Z/QHeQnePhMQrexHQhNzwc8IbEpRJAdx/XSlFDErZVxEfvc1zKoQ9bt+3hrwZg
	 gBkC9edo3fqAlUMwO9WPmj1fQgEe13GmInVro8jx+iBe4VTPwiBrhAgyvg+w0pcicM
	 KzV842YhuP9drZft3gInFMVnyptu7QyblajITYTQq3+oRf7qo/ROj/1aVyu0nkwV3O
	 x/xNfFM2gA4CqvDgHM3lMiAHQN2flu0tpjU0IN2Pm3RoZtItAyx+6gPdr+Srxv86uD
	 5X8paWPBwQcn4zRQu6x3n4FL32RgRtIIDOd6aGb4lDPRA6cO5NbcJVlpo1wLVQ/oBT
	 8NDU+/W58zm0w==
Date: Tue, 26 Jan 2021 12:22:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com> <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com> <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1474181428-1611690987=:2568"
Content-ID: <alpine.DEB.2.21.2101261157150.2568@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1474181428-1611690987=:2568
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101261157151.2568@sstabellini-ThinkPad-T480s>

On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
> On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
>       > Thanks for the response!
>       >
>       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       + xen-devel, Roman,
>       >
>       >
>       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
>       >       > Hi Stefano,
>       >       > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on mobile platforms. One of our HW that we use on
>       >       development is
>       >       > Raspberry Pi 4B. I wonder if you could help me a bit :).
>       >       >
>       >       > I'm trying to enable the GPU with Xen + Raspberry Pi for
>       >       dom0. https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
>       >       >
>       >       > I got so far that GPU drivers are loaded (v3d & vc4) without errors. But now Xen returns error when X is starting:
>       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
>       >       >  I tried to debug what causes this and looks like find_mmio_handler cannot find handler.
>       >       > (See more here: https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 )
>       >       >
>       >       > Any ideas why the handler is not found?
>       >
>       >
>       >       Hi Jukka,
>       >
>       >       I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
>       >       haven't tried the GPU yet, I have been using the serial only.
>       >       Roman, did you ever get the GPU working?
>       >
>       >
>       >       The error is a data abort error: Linux is trying to access an address
>       >       which is not mapped to dom0. The address seems to be 0x401315d000. It is
>       >       a pretty high address; I looked in device tree but couldn't spot it.
>       >
>       >       >From the HSR (the syndrom register) it looks like it is a translation
>       >       fault at EL1 on stage1. As if the Linux address mapping was wrong.
>       >       Anyone has any ideas how this could happen? Maybe a reserved-memory
>       >       misconfiguration?
>       >
>       > I had issues with loading the driver in the first place. Apparently swiotlb is used, maybe it can cause this. I also tried to
>       enable CMA.
>       > config.txt:
>       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
>       > gpu_mem=128
> 
>       Also looking at your other reply and the implementation of
>       vc4_bo_create, it looks like this is a CMA problem.
> 
>       It would be good to run a test with the swiotlb-xen disabled:
> 
>       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
>       index 467fa225c3d0..2bdd12785d14 100644
>       --- a/arch/arm/xen/mm.c
>       +++ b/arch/arm/xen/mm.c
>       @@ -138,8 +138,7 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>        static int __init xen_mm_init(void)
>        {
>               struct gnttab_cache_flush cflush;
>       -       if (!xen_initial_domain())
>       -               return 0;
>       +       return 0;
>               xen_swiotlb_init(1, false);
> 
>               cflush.op = 0;
> 
> With this change the kernel is not booting up. (btw. I'm using USB SSD for my OS.)
> [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> [    1.212820] usb 1-1: device descriptor read/64, error 18
> [    1.452815] usb 1-1: device descriptor read/64, error 18
> [    1.820813] usb 1-1: device descriptor read/64, error 18
> [    2.060815] usb 1-1: device descriptor read/64, error 18
> [    2.845548] usb 1-1: device descriptor read/8, error -61
> [    2.977603] usb 1-1: device descriptor read/8, error -61
> [    3.237530] usb 1-1: device descriptor read/8, error -61
> [    3.369585] usb 1-1: device descriptor read/8, error -61
> [    3.480765] usb usb1-port1: unable to enumerate USB device
> 
> Traces stop here. I could try with a memory card. Maybe it makes a difference.

This is very surprising. Disabling swiotlb-xen should make things better
not worse. The only reason I can think of why it could make things worse
is if Linux runs out of low memory. Julien's patch
437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have addressed
that issue though. Julien, any ideas?

 
>       It is going to be fine just to boot Dom0 and DomUs without PV drivers.
>       Also, can you post the device tree that you are using here? Just in case
>       there is an issue with Xen parsing any possible /reserved-memory nodes
>       with CMA info that need to be passed on to Dom0.
> 
> Here is the device dumped from command line:
> dtc -I fs /proc/device-tree
> https://drive.google.com/file/d/17u18dJHxRfbGZMtRXIwtLVZZfMj9KwN-/view?usp=sharing

There is a reserved-memory node:

	reserved-memory {
		#address-cells = <0x02>;
		#size-cells = <0x01>;
		ranges;
		phandle = <0x3f>;

		linux,cma {
			linux,cma-default;
			alloc-ranges = <0x00 0x00 0x30000000>;
			compatible = "shared-dma-pool";
			size = <0x10000000>;
			phandle = <0x40>;
			reusable;
		};
	};

But in theory Xen should be able to export it to Dom0. It would be worth
verifying that by running the same dtc -I fs /proc/device-tree in dom0 (in
the dom0 configuration that can finish booting of course) you get the
same reserved-memory node.

There is also another suspicious node here:

	axi {
		vc_mem {
			reg = <0x3eb00000 0x3ff00000 0xc0000000>;
		};
	}; 
 
Which doesn't seem device tree exactly compliant and maybe GPU related.
But again, Xen would probably export it as is to Dom0.


 
>       >       > p.s.
>       >       > While testing I found issue with Xen master branch and your patch: xen/rpi4: implement watchdog-based reset
>       >       >
>       >       > Looks like black listing the bcm2835-pm
>       >       > @@ -37,12 +41,69 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>       >       >       * The aux peripheral also shares a page with the aux UART.
>       >       >       */
>       >       >      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
>       >       > +    /* Special device used for rebooting */
>       >       > +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>       >       >
>       >       > will prevent v3d driver to locate phandle. I think it will use the same resource:
>       >       >   pm: watchdog@7e100000 {
>       >       >       compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
>       >       > #power-domain-cells = <1>;
>       >       > #reset-cells = <1>;
>       >       > reg = <0x7e100000 0x114>,
>       >       >      <0x7e00a000 0x24>,
>       >       >      <0x7ec11000 0x20>;
>       >       > clocks = <&clocks BCM2835_CLOCK_V3D>,
>       >       > <&clocks BCM2835_CLOCK_PERI_IMAGE>,
>       >       > <&clocks BCM2835_CLOCK_H264>,
>       >       > <&clocks BCM2835_CLOCK_ISP>;
>       >       > clock-names = "v3d", "peri_image", "h264", "isp";
>       >       > system-power-controller;
>       >       >
>       >       > };
>       >
>       >       Yeah, I imagine it could be possible. Can you post the error message you
>       >       are seeing from the v3d driver?
>       >
>       > This is the error:
>       > [    0.069682] OF: /v3dbus/v3d@7ec04000: could not find phandle
>       > [    0.074828] OF: /v3dbus/v3d@7ec04000: could not find phandle
>       > v3d driver is not loaded.
--8323329-1474181428-1611690987=:2568--

