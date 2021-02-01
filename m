Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7A309FCF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 02:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79492.144684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6NZF-0005qx-Op; Mon, 01 Feb 2021 00:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79492.144684; Mon, 01 Feb 2021 00:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6NZF-0005qZ-Lu; Mon, 01 Feb 2021 00:59:49 +0000
Received: by outflank-mailman (input) for mailman id 79492;
 Mon, 01 Feb 2021 00:59:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6NZE-0005qT-0d
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 00:59:48 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a2e47ce-d4dd-4209-b150-3625a6697b31;
 Mon, 01 Feb 2021 00:59:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a1so14806104wrq.6
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 16:59:46 -0800 (PST)
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
X-Inumbo-ID: 1a2e47ce-d4dd-4209-b150-3625a6697b31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVI+DSMjX7ADoTI85ShtDDtbltiIpAG4FoX74uUSix0=;
        b=CaD1fb64ht9Ft8AEAWiK7zJCLKg6irwCgxgGMomLOniEnYhKaxIXui+ZrF13iVXetg
         Q1mmUWC1AP7HQ86TPBEWPOLN4uzXMtLLAnCRIg1a7yicJe7d0KkyC3m1781oih0ME4Hp
         J132/I9gurcdutMF33OczQ7TNVSRrcHmInENxZsUiZtIx2c0T1tTD6NIMn1JKotVapXu
         iJuk02T0MT6YurPmnDuN4EEWWeF0sZLapE17nLG/v7zV+xhpliDQK3IQcO2DNt6IcenR
         KWh744W8VAjmCCGE1whOPK4XbId09oXiNk5HJekev94VeVF+MvXwVoTSdtZlE8HY6MQq
         keHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVI+DSMjX7ADoTI85ShtDDtbltiIpAG4FoX74uUSix0=;
        b=eJ8rYzqYeEXWPaBf/fyb5HLorF17vvHz5gtHcQiIXUdftXXRgiHrrwJ6RuzDOblSR/
         18kvfF1jnty2gaS91WMIy/2ocPKj+69PMHSfzPtnxUB/iH47XBT/74lGEevSppVS8t+v
         swDgyRiJaXtv8pslRr9Tz/t8y/SkdcMjKg86R39h4awiDPf/pEWhkudu2xjUM+hqmjPD
         wd+4E/UsA4HJlTcBXaOrfbRs2C8YQdgiA6f5ObkJbyf7l8dz3Do5pi9GTlelI0nDtV9O
         B/06bWXfVJdjsJR2h6UUqiwVGu2lCX418g9MbKj3Y9GF9NGFqBzK0OiHDkFi2lGt7ULy
         w28g==
X-Gm-Message-State: AOAM533ruV6cBEuxwycvPyNaLtwuELmkzx41mdFmS8LLmfsErkj24cz9
	X9oqm6cz/kQ3TqFH/CJuKtqf3B9vvep7fGBtwd0=
X-Google-Smtp-Source: ABdhPJwpF4ynxnzTjCxUkhogwbwb0CbkZteTb5NOvGcbr99LVqMpLmjHE8bY+t3HLcERf16aB8Tz+UMxqkRZRkqGsvk=
X-Received: by 2002:adf:ffce:: with SMTP id x14mr15971767wrs.390.1612141185830;
 Sun, 31 Jan 2021 16:59:45 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
In-Reply-To: <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 31 Jan 2021 19:59:09 -0500
Message-ID: <CABfawh=bwM8B8CH+BQ2OqbStSvaAGjA2JD2GWMru6JS0r_OHDg@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+undef@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 6:50 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> > > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > > (XEN) Device tree generation failed (-22).
> >
> > > Does anyone have an idea what might be going wrong here? I tried
> > > building the dtb without using the dtb overlay but it didn't seem to
> > > do anything.
> >
> > If you go to line 1412 of the file xen/arch/arm/domain_build.c and
> > replace the "return res;" with "continue;" that will bypass the issue.
> > The 3 people I'm copying on this message though may wish to ask questions
> > about the state of your build tree.
>
> I'll try that but it's a pretty hacky work-around ;)

That change got Xen to continue but then I don't see any outfrom from
dom0 afterwards and the system just hangs:

(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000000480000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x00000010000000-0x00000028000000 (384MB)
(XEN) BANK[1] 0x00000030000000-0x00000038000000 (128MB)
(XEN) Grant table range: 0x00000000200000-0x00000000240000
(XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000000480000 to 0000000010000000-0000000010f80000
(XEN) Loading d0 DTB to 0x0000000018000000-0x000000001800bde9
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
(XEN) Please update your firmware.
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 352kB init memory.

Tamas

