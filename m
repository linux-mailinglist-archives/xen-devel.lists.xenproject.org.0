Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69B959420
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 07:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780901.1190505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sge0h-0000vG-9P; Wed, 21 Aug 2024 05:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780901.1190505; Wed, 21 Aug 2024 05:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sge0h-0000ti-6c; Wed, 21 Aug 2024 05:35:55 +0000
Received: by outflank-mailman (input) for mailman id 780901;
 Wed, 21 Aug 2024 05:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yaOv=PU=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sge0f-0000tW-JB
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 05:35:53 +0000
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c5cc56-5f7f-11ef-a507-bb4a2ccca743;
 Wed, 21 Aug 2024 07:35:50 +0200 (CEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47L5ZiCC083230;
 Wed, 21 Aug 2024 00:35:44 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47L5ZiZ7007703
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Aug 2024 00:35:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Aug 2024 00:35:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Aug 2024 00:35:44 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.72.75])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47L5Zgba030679;
 Wed, 21 Aug 2024 00:35:43 -0500
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
X-Inumbo-ID: 38c5cc56-5f7f-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724218544;
	bh=AcuPLkn7dksPeuORE/kW0nBgcLoMoEslflOsaxQSJfU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=W7fZ3XrojT3oM1Qu3TyB4eSMtumxa11fH7y0AL0TR5FsqoElUHxElWhTs4bjiC4J/
	 1G3WG40GPbshepjWJH/mnu7hrl5EyEBxzg9jsLqzpTE5+svwFEtZy5bIQSjYyNa+rt
	 To8cUl7bqmKqTlWyKBFTbrmN5hmEZjM5Mjjip0xk=
Date: Wed, 21 Aug 2024 11:05:42 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
        <sstabellini@kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v2] drivers: char: omap-uart: provide a
 default clock frequency
Message-ID: <qu7setyrwkh7clo7dxb5iolx2mwcpkd4n45gjthxravmw3gyeo@ged7k7khka54>
References: <20240820082202.326644-1-a-singh21@ti.com>
 <a75c4202-1d66-45d0-be57-f29cacb6237c@amd.com>
 <edb52fc6-fc69-4670-a1bd-e3e960a6e408@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edb52fc6-fc69-4670-a1bd-e3e960a6e408@xen.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello,

On 10:03-20240820, Julien Grall wrote:
> Hi,
> 
> On 20/08/2024 10:00, Michal Orzel wrote:
> > On 20/08/2024 10:22, Amneesh Singh wrote:
> >>
> >>
> >> Quite a few TI K3 devices do not have clock-frequency specified in their
> >> respective UART nodes. However hard-coding the frequency is not a
> >> solution as the function clock input can differ between SoCs. So, use a
> >> default frequency of 48MHz if the device tree does not specify one.
> > I'd mention that this is same as Linux
> >
> >>
> >> Signed-off-by: Amneesh Singh <a-singh21@ti.com>
> >> ---
> >>   xen/drivers/char/omap-uart.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >> ---
> >> v1: https://lore.kernel.org/all/20240719113313.145587-1-a-singh21@ti.com/T/
> >>
> >> v1 -> v2
> >> - Ditch adding a dtuart option
> >> - Use a default value instead
> >>
> >> This default is the same one as found in the 8250_omap driver of the
> >> linux tree. Already tested with Xen.
> >>
> >> diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
> >> index 1079198..9d3d39c 100644
> >> --- a/xen/drivers/char/omap-uart.c
> >> +++ b/xen/drivers/char/omap-uart.c
> >> @@ -48,6 +48,9 @@
> >>   /* System configuration register */
> >>   #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
> >>
> >> +/* default clock frequency in hz */
> >> +#define UART_OMAP_DEFAULT_CLK_SPEED 48000000
> > I think this should have U suffix to please MISRA 7.2

Can I count on you to add this unsigned suffix as well? Thanks.

> >
> >> +
> >>   #define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
> >>   #define omap_write(uart, off, val) writel(val, \
> >>                                             (uart)->regs + ((off) << REG_SHIFT))
> >> @@ -322,8 +325,9 @@ static int __init omap_uart_init(struct dt_device_node *dev,
> >>       res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
> >>       if ( !res )
> >>       {
> >> -        printk("omap-uart: Unable to retrieve the clock frequency\n");
> >> -        return -EINVAL;
> >> +        printk("omap-uart: Unable to retrieve the clock frequency, "
> >> +               "defaulting to %uHz\n", UART_OMAP_DEFAULT_CLK_SPEED);
> > Even though there is a comma, printk messages should not really be split. In such cases it's fine
> > to exceed 80 chars limit. Or do:
> 
> In general, we allow to exceed the limit only for the message. If there
> are arguments then ...
> 
> >          printk("omap-uart: Clock frequency not specified, defaulting to %uHz\n",
> >                 UART_OMAP_DEFAULT_CLK_SPEED);
> 
> ... this is the preferred approach. I can do the update on commit if an
> updated commit message is provided.

Please do, thanks. You can use this as the commit message:

[quote]

Quite a few TI K3 devices do not have clock-frequency specified in their
respective UART nodes. However hard-coding the frequency is not a
solution as the function clock input can differ between SoCs. So, use a
default frequency of 48MHz, which is the same as the linux default (see
8250_omap.c), if the device tree does not specify it.

[/quote]

Or if you'd prefer, I can resend the thing with the suggested changes.

> 
> Cheers,
> 
> --
> Julien Grall
> 
>

Regards
Amneesh

