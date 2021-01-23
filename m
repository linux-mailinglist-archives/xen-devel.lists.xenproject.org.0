Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495123011AA
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 01:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73163.131921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l36m5-0000VH-Hr; Sat, 23 Jan 2021 00:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73163.131921; Sat, 23 Jan 2021 00:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l36m5-0000Us-EV; Sat, 23 Jan 2021 00:27:33 +0000
Received: by outflank-mailman (input) for mailman id 73163;
 Sat, 23 Jan 2021 00:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmv8=G2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l36m3-0000Un-1O
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 00:27:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e17c21f1-5eaf-4525-9522-d5f63e6de432;
 Sat, 23 Jan 2021 00:27:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DE6923AF8;
 Sat, 23 Jan 2021 00:27:29 +0000 (UTC)
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
X-Inumbo-ID: e17c21f1-5eaf-4525-9522-d5f63e6de432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611361649;
	bh=AwUPzkVsHLBKAJRSNooEyyL7+Y721TQHrZXpUnsRC+E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BUF7vEkVwcoLYuldhsSWh5cH4jbxyOQbZ8wqHnqlKQ27aEdn2AUmgNTTqX3Wwio+p
	 intnFLdqLamQBcqB8LdnN1VH8wGvVtvIAHMqyfhu7dTpFv9oMAThbkrfp8NJtwHxOG
	 JguCs1MXEe9l9vCaDkITjZuKj1J0au4ztQakdNX21IYmDAVZg9GqR3HqFqsJiBABuh
	 qLuYQtyaOOpCvZevxYM5U5KRLF9GOCWqyU8379qLaVQw0YijQyHP0qH8+QJR5u1D00
	 ryKWfZN5VOqjwXmRanqlQK9XMNweUiROODOuAC+79YO6RdU9RWVfsz1wLaebKhsMWb
	 0fs0735gZIMcw==
Date: Fri, 22 Jan 2021 16:27:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, roman@zededa.com, 
    julien@xen.org, Bertrand.Marquis@arm.com
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1512461671-1611355819=:14612"
Content-ID: <alpine.DEB.2.21.2101221450260.14612@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1512461671-1611355819=:14612
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101221450261.14612@sstabellini-ThinkPad-T480s>

+ xen-devel, Roman,


On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> Hi Stefano,
> I'm Jukka Kaartinen a SW developer working on enabling hypervisors on mobile platforms. One of our HW that we use on development is
> Raspberry Pi 4B. I wonder if you could help me a bit :).
> 
> I'm trying to enable the GPU with Xen + Raspberry Pi for dom0. https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> 
> I got so far that GPU drivers are loaded (v3d & vc4) without errors. But now Xen returns error when X is starting:
> (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
>  I tried to debug what causes this and looks like find_mmio_handler cannot find handler.
> (See more here: https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 )
> 
> Any ideas why the handler is not found?


Hi Jukka,

I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
haven't tried the GPU yet, I have been using the serial only.
Roman, did you ever get the GPU working?


The error is a data abort error: Linux is trying to access an address
which is not mapped to dom0. The address seems to be 0x401315d000. It is
a pretty high address; I looked in device tree but couldn't spot it.

From the HSR (the syndrom register) it looks like it is a translation
fault at EL1 on stage1. As if the Linux address mapping was wrong.
Anyone has any ideas how this could happen? Maybe a reserved-memory
misconfiguration?



> p.s.
> While testing I found issue with Xen master branch and your patch: xen/rpi4: implement watchdog-based reset
> 
> Looks like black listing the bcm2835-pm
> @@ -37,12 +41,69 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>       * The aux peripheral also shares a page with the aux UART.
>       */
>      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> +    /* Special device used for rebooting */
> +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
> 
> will prevent v3d driver to locate phandle. I think it will use the same resource:
>   pm: watchdog@7e100000 {
>       compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
> #power-domain-cells = <1>;
> #reset-cells = <1>;
> reg = <0x7e100000 0x114>,
>      <0x7e00a000 0x24>,
>      <0x7ec11000 0x20>;
> clocks = <&clocks BCM2835_CLOCK_V3D>,
> <&clocks BCM2835_CLOCK_PERI_IMAGE>,
> <&clocks BCM2835_CLOCK_H264>,
> <&clocks BCM2835_CLOCK_ISP>;
> clock-names = "v3d", "peri_image", "h264", "isp";
> system-power-controller;
> 
> };

Yeah, I imagine it could be possible. Can you post the error message you
are seeing from the v3d driver?
--8323329-1512461671-1611355819=:14612--

