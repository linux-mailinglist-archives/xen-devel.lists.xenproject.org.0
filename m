Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED22A35EE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 22:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17930.42655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZhHc-0001bB-6R; Mon, 02 Nov 2020 21:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17930.42655; Mon, 02 Nov 2020 21:22:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZhHc-0001am-3B; Mon, 02 Nov 2020 21:22:32 +0000
Received: by outflank-mailman (input) for mailman id 17930;
 Mon, 02 Nov 2020 21:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kZhHZ-0001ae-UO
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 21:22:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4609a19-df7c-4e31-9d58-27fd73b49407;
 Mon, 02 Nov 2020 21:22:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2041620870;
 Mon,  2 Nov 2020 21:22:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0q6w=EI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kZhHZ-0001ae-UO
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 21:22:29 +0000
X-Inumbo-ID: f4609a19-df7c-4e31-9d58-27fd73b49407
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f4609a19-df7c-4e31-9d58-27fd73b49407;
	Mon, 02 Nov 2020 21:22:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2041620870;
	Mon,  2 Nov 2020 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604352148;
	bh=VLEs5r+Tq8CyV7YqEW5qiMidUK+i28krX2EW6kK/wMs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XphNAwkzmTVq0XQFyLUwxQ7HHQwblJUvXA0j6bOzFR3wRo+n6Oe6tss42hwaBDhVS
	 hKxXYCGK9WJL5/zHrybZhmxXS1UZKZ1FUq7Q3KkKvf/3J0h5gGBr6clNBNAbbNhx6O
	 NlaMm2Lv+JtoWEneQ/L/T8Be/g7UZ6Jj2lXG2Nmg=
Date: Mon, 2 Nov 2020 13:22:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ash Wilding <ash.j.wilding@gmail.com>
cc: sstabellini@kernel.org, ehem+xen@m5p.com, julien@xen.org, roman@zededa.com, 
    xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
In-Reply-To: <20201101172608.90996-1-ash.j.wilding@gmail.com>
Message-ID: <alpine.DEB.2.21.2011021321050.5812@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010301240450.12247@sstabellini-ThinkPad-T480s> <20201101172608.90996-1-ash.j.wilding@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Nov 2020, Ash Wilding wrote:
> >> I think the best compromise is still to use an ACPI string to detect
> >> the platform. For instance, would it be possible to use the OEMID
> >> fields in RSDT, XSDT, FADT?  Possibly even a combination of them?
> >>
> >> Another option might be to get the platform name from UEFI somehow. 
> >
> > I included appropriate strings in e-mail.  Suitable strings do appear
> > in `dmesg`.
> 
> 
> Just as a heads-up, SMCCC does define the optional SMCCC_ARCH_SOC_ID [1]
> function and this is listed as mandatory in the Server Base Boot Reqs
> (SBBR); see pp 15 of ARM DEN 0044F [2].

Thanks for sharing, it is good to know there is a "proper" way to do it.


> Unfortunately it looks like RPi 4's firmware doesn't currently support
> this, or at least the rpi4-uefi project [3] didn't think so as of FW
> version 1.6 [4], but I couldn't find equivalent SBBR feature tracking
> pages on that site for FW versions 1.7 or 1.8 to confirm, nor could I
> find any reference to SMCCC_ARCH_SOC_ID in the RPi 4 FW sources [5].

Well, call me an optimist but maybe it is just one patch away from
happening :-)


> On the bright side, while not very helpful in the short-term, note that
> Arm's recently announced SystemReady [6] program is an evolution of
> ServerReady (SBSA+SBBR) but for other segments and applications incl.
> Embedded, IoT, and general Linux Boot.
> 
> That means in future we should see more platform firmware supporting
> SMCCC_ARCH_SOC_ID, as the SiPs will (hopefully) want their platforms to
> be SystemReady certified.
> 
> Hope that's useful info.
> 
> Thanks,
> Ash.
> 
> [1] https://developer.arm.com/documentation/den0028/c
> [2] https://developer.arm.com/documentation/den0044/latest
> [3] https://rpi4-uefi.dev/about/
> [4] https://rpi4-uefi.dev/status-v1-6-firmware/
> [5] https://github.com/pftf/RPi4/tree/master
> [6] https://developer.arm.com/architectures/system-architectures/arm-systemready
> 

