Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679C5303109
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 01:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74583.134069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ccz-0002di-90; Tue, 26 Jan 2021 00:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74583.134069; Tue, 26 Jan 2021 00:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ccz-0002dM-5n; Tue, 26 Jan 2021 00:54:41 +0000
Received: by outflank-mailman (input) for mailman id 74583;
 Tue, 26 Jan 2021 00:54:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4Ccy-0002dH-7i
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 00:54:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9ba1fe2-a62e-41dd-bc0c-82dc561d9f9c;
 Tue, 26 Jan 2021 00:54:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90260207B3;
 Tue, 26 Jan 2021 00:54:38 +0000 (UTC)
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
X-Inumbo-ID: a9ba1fe2-a62e-41dd-bc0c-82dc561d9f9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611622478;
	bh=4iFmy4UmGD4EzRAcV+EbemXfx/zo96OVg1KIt0jT434=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iQIprtg+FnDMjb8ly3YJOmfohxuyEH7CeBpWpJ5zM6AkvJ/JZeOgGWLfPG/BFfoDm
	 N0vMzdCFGKNE503TxLOPOuN+Y4YQBunwoE8dg+HLtwgf/OK8D7wLHTEWHbUiwVtrxV
	 9+JMa3vppZz6s+flIHIO4JesAnJurdBqPwGfWL0aeVcMAK8xxyB3eMEtju2Ys5hdJi
	 uQhz8v8yCb2shJUlIRDACl4q2+FGT8FEkixoep/gSyrB3mmA3O+S77GThUFv9OrXvQ
	 MOxvaOvSceiSq4H+BKyNvx1RYtmNtT92EzGGb4YE/P9bklGKFPzg5/NuimEoAym3/o
	 InDN+etNXR58w==
Date: Mon, 25 Jan 2021 16:54:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, roman@zededa.com, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com> <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1143111070-1611622092=:20638"
Content-ID: <alpine.DEB.2.21.2101251650000.20638@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1143111070-1611622092=:20638
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101251650001.20638@sstabellini-ThinkPad-T480s>

On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
> Thanks for the response!
> 
> On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       + xen-devel, Roman,
> 
> 
>       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
>       > Hi Stefano,
>       > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on mobile platforms. One of our HW that we use on
>       development is
>       > Raspberry Pi 4B. I wonder if you could help me a bit :).
>       >
>       > I'm trying to enable the GPU with Xen + Raspberry Pi for
>       dom0. https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
>       >
>       > I got so far that GPU drivers are loaded (v3d & vc4) without errors. But now Xen returns error when X is starting:
>       > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
>       >  I tried to debug what causes this and looks like find_mmio_handler cannot find handler.
>       > (See more here: https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 )
>       >
>       > Any ideas why the handler is not found?
> 
> 
>       Hi Jukka,
> 
>       I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
>       haven't tried the GPU yet, I have been using the serial only.
>       Roman, did you ever get the GPU working?
> 
> 
>       The error is a data abort error: Linux is trying to access an address
>       which is not mapped to dom0. The address seems to be 0x401315d000. It is
>       a pretty high address; I looked in device tree but couldn't spot it.
> 
>       >From the HSR (the syndrom register) it looks like it is a translation
>       fault at EL1 on stage1. As if the Linux address mapping was wrong.
>       Anyone has any ideas how this could happen? Maybe a reserved-memory
>       misconfiguration?
> 
> I had issues with loading the driver in the first place. Apparently swiotlb is used, maybe it can cause this. I also tried to enable CMA.
> config.txt:
> dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
> gpu_mem=128

Also looking at your other reply and the implementation of
vc4_bo_create, it looks like this is a CMA problem.

It would be good to run a test with the swiotlb-xen disabled:

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 467fa225c3d0..2bdd12785d14 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -138,8 +138,7 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
-	if (!xen_initial_domain())
-		return 0;
+	return 0;
 	xen_swiotlb_init(1, false);
 
 	cflush.op = 0;

It is going to be fine just to boot Dom0 and DomUs without PV drivers.
Also, can you post the device tree that you are using here? Just in case
there is an issue with Xen parsing any possible /reserved-memory nodes
with CMA info that need to be passed on to Dom0.


>       > p.s.
>       > While testing I found issue with Xen master branch and your patch: xen/rpi4: implement watchdog-based reset
>       >
>       > Looks like black listing the bcm2835-pm
>       > @@ -37,12 +41,69 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>       >       * The aux peripheral also shares a page with the aux UART.
>       >       */
>       >      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
>       > +    /* Special device used for rebooting */
>       > +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>       >
>       > will prevent v3d driver to locate phandle. I think it will use the same resource:
>       >   pm: watchdog@7e100000 {
>       >       compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
>       > #power-domain-cells = <1>;
>       > #reset-cells = <1>;
>       > reg = <0x7e100000 0x114>,
>       >      <0x7e00a000 0x24>,
>       >      <0x7ec11000 0x20>;
>       > clocks = <&clocks BCM2835_CLOCK_V3D>,
>       > <&clocks BCM2835_CLOCK_PERI_IMAGE>,
>       > <&clocks BCM2835_CLOCK_H264>,
>       > <&clocks BCM2835_CLOCK_ISP>;
>       > clock-names = "v3d", "peri_image", "h264", "isp";
>       > system-power-controller;
>       >
>       > };
> 
>       Yeah, I imagine it could be possible. Can you post the error message you
>       are seeing from the v3d driver?
> 
> This is the error:
> [    0.069682] OF: /v3dbus/v3d@7ec04000: could not find phandle
> [    0.074828] OF: /v3dbus/v3d@7ec04000: could not find phandle
> v3d driver is not loaded.
> 
> --
> Br,
> Jukka Kaartinen
> 
> 
--8323329-1143111070-1611622092=:20638--

