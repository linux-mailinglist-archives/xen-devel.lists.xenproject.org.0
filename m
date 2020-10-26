Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC632998D5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 22:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12568.32711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXA6X-0001Xa-CN; Mon, 26 Oct 2020 21:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12568.32711; Mon, 26 Oct 2020 21:32:37 +0000
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
	id 1kXA6X-0001XB-8O; Mon, 26 Oct 2020 21:32:37 +0000
Received: by outflank-mailman (input) for mailman id 12568;
 Mon, 26 Oct 2020 21:32:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GsP=EB=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kXA6W-0001X6-1o
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 21:32:36 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb390f28-432c-4117-8f83-1a60479a3cf5;
 Mon, 26 Oct 2020 21:32:34 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09QLWP13023597
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 26 Oct 2020 17:32:30 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09QLWOUX023596;
 Mon, 26 Oct 2020 14:32:24 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/GsP=EB=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kXA6W-0001X6-1o
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 21:32:36 +0000
X-Inumbo-ID: cb390f28-432c-4117-8f83-1a60479a3cf5
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cb390f28-432c-4117-8f83-1a60479a3cf5;
	Mon, 26 Oct 2020 21:32:34 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09QLWP13023597
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 26 Oct 2020 17:32:30 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09QLWOUX023596;
	Mon, 26 Oct 2020 14:32:24 -0700 (PDT)
	(envelope-from ehem)
Date: Mon, 26 Oct 2020 14:32:24 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201026213224.GB20589@mattapan.m5p.com>
References: <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
 <20201026160316.GA20589@mattapan.m5p.com>
 <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Oct 26, 2020 at 06:44:27PM +0000, Julien Grall wrote:
> Hi Elliott,
> 
> On 26/10/2020 16:03, Elliott Mitchell wrote:
> > On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
> >> On 24/10/2020 06:35, Elliott Mitchell wrote:
> >>> ACPI has a distinct
> >>> means of specifying a limited DMA-width; the above fails, because it
> >>> assumes a *device-tree*.
> >>
> >> Do you know if it would be possible to infer from the ACPI static table
> >> the DMA-width?
> > 
> > Yes, and it is.  Due to not knowing much about ACPI tables I don't know
> > what the C code would look like though (problem is which documentation
> > should I be looking at first?).
> 
> What you provided below is an excerpt of the DSDT. AFAIK, DSDT content 
> is written in AML. So far the shortest implementation I have seen for 
> the AML parser is around 5000 lines (see [1]). It might be possible to 
> strip some the code, although I think this will still probably too big 
> for a single workaround.
> 
> What I meant by "static table" is a table that looks like a structure 
> and can be parsed in a few lines. If we can't find on contain the DMA 
> window, then the next best solution is to find a way to identity the 
> platform.
> 
> I don't know enough ACPI to know if this solution is possible. A good 
> starter would probably be the ACPI spec [2].

Be assured, you likely know more about ACPI than I do.  :-)

A crucial point though is the mentions of dealing with DMA on the
Raspberry PI 4B using ACPI pointed at that "_DMA" string.  What is there
is Good Enough(tm) to make a 5.8 Linux kernel successfully operate
using ACPI.

Looking at the 5.8 source, apparently _DMA is an ACPI method.  That
almost looks straightforward enough for me to tackle for Xen...
Good news is looks like only supportting a single DMA window...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



