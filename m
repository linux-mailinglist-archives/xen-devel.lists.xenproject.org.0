Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF129CD6F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 02:55:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13275.33818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXafe-0006O8-Sy; Wed, 28 Oct 2020 01:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13275.33818; Wed, 28 Oct 2020 01:54:38 +0000
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
	id 1kXafe-0006Nq-O8; Wed, 28 Oct 2020 01:54:38 +0000
Received: by outflank-mailman (input) for mailman id 13275;
 Wed, 28 Oct 2020 01:54:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCqx=ED=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kXafc-0006Nl-O1
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 01:54:36 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d564ce3e-4fa9-44c0-909b-f2a0ca8ec0b4;
 Wed, 28 Oct 2020 01:54:35 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09S1sOxZ034410
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 27 Oct 2020 21:54:30 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09S1sN2l034409;
 Tue, 27 Oct 2020 18:54:23 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aCqx=ED=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kXafc-0006Nl-O1
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 01:54:36 +0000
X-Inumbo-ID: d564ce3e-4fa9-44c0-909b-f2a0ca8ec0b4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d564ce3e-4fa9-44c0-909b-f2a0ca8ec0b4;
	Wed, 28 Oct 2020 01:54:35 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09S1sOxZ034410
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 27 Oct 2020 21:54:30 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09S1sN2l034409;
	Tue, 27 Oct 2020 18:54:23 -0700 (PDT)
	(envelope-from ehem)
Date: Tue, 27 Oct 2020 18:54:23 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201028015423.GA33407@mattapan.m5p.com>
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

Okay, that is worse than I had thought (okay, ACPI is impressively
complex for something nominally firmware-level).

There are strings in the present Tianocore implementation for Raspberry
PI 4B which could be targeted.  Notably included in the output during
boot listing the tables, "RPIFDN", "RPIFDN RPI" and "RPIFDN RPI4" (I'm
unsure how kosher these are as this wsn't implemented nor blessed by the
Raspberry PI Foundation).

I strongly dislike this approach as you soon turn the Xen project into a
database of hardware.  This is already occurring with
xen/arch/arm/platforms and I would love to do something about this.  On
that thought, how about utilizing Xen's command-line for this purpose?

Have a procedure of during installation/updates retrieve DMA limitation
information from the running OS and the following boot Xen will follow
the appropriate setup.  By its nature, Domain 0 will have the information
needed, just becomes an issue of how hard that is to retrieve...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



