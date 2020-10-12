Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F307428C42F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 23:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6034.15800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS5TO-0007UR-7L; Mon, 12 Oct 2020 21:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6034.15800; Mon, 12 Oct 2020 21:35:14 +0000
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
	id 1kS5TO-0007U0-3z; Mon, 12 Oct 2020 21:35:14 +0000
Received: by outflank-mailman (input) for mailman id 6034;
 Mon, 12 Oct 2020 21:35:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kS5TM-0007Tv-KN
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 21:35:12 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44a200bb-fba6-4669-ae4e-e0c31806915c;
 Mon, 12 Oct 2020 21:35:11 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09CLYqhX089433
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 Oct 2020 17:34:58 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09CLYpGX089432;
 Mon, 12 Oct 2020 14:34:51 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kS5TM-0007Tv-KN
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 21:35:12 +0000
X-Inumbo-ID: 44a200bb-fba6-4669-ae4e-e0c31806915c
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 44a200bb-fba6-4669-ae4e-e0c31806915c;
	Mon, 12 Oct 2020 21:35:11 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09CLYqhX089433
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 12 Oct 2020 17:34:58 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09CLYpGX089432;
	Mon, 12 Oct 2020 14:34:51 -0700 (PDT)
	(envelope-from ehem)
Date: Mon, 12 Oct 2020 14:34:51 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>,
        bertrand.marquis@arm.com, andre.przywara@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
Message-ID: <20201012213451.GA89158@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
 <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Oct 12, 2020 at 12:02:14PM -0700, Stefano Stabellini wrote:
> On Sat, 10 Oct 2020, Julien Grall wrote:
> > Therefore, I think the code should not try to find the STAO. Instead, it
> > should check whether the SPCR table is present.
> 
> Yes, that makes sense, but that brings me to the next question.
> 
> SPCR seems to be required by SBBR, however, Masami wrote that he could
> boot on a system without SPCR, which gets me very confused for two
> reasons:
> 
> 1) Why there is no SPCR? Isn't it supposed to be mandatory? Is it
> because there no UART on Masami's system?

I'm on different hardware, but some folks have setup Tianocore for it.
According to Documentation/arm64/acpi_object_usage.rst,
"Required: DSDT, FADT, GTDT, MADT, MCFG, RSDP, SPCR, XSDT".  Yet when
booting a Linux kernel directly on the hardware it lists APIC, BGRT,
CSRT, DSDT, DBG2, FACP, GTDT, PPTT, RSDP, and XSDT.

I don't know whether Linux's ACPI code omits mention of some required
tables and merely panics if they're absent.  Yet I'm speculating the list
of required tables has shrunk, SPCR is no longer required, and the
documentation is out of date.  Perhaps SPCR was required in early Linux
ACPI implementations, but more recent ones removed that requirement?

> 2) If there is no SPCR, how did Masami manage to boot Xen?
> I take without any serial output? Just with the framebuffer?

On my board the provided tables are sufficient to let Linux identify
ttyAMA0.  Linux's efifb driver finds the framebuffer and apparently has
it usable.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



